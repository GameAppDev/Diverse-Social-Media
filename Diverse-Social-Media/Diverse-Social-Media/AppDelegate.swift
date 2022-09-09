//
//  AppDelegate.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 23.07.2022.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        getLanguage()
        
        decideUserLoggedInStatusAndContinue()
        
        return true
    }
    
    private func getLanguage() {
        // languages -> en, de, tr
        var deviceLang: String = "da"// Locale.current.languageCode ?? "en"
        let appLanguages: [String] = ApplicationConstants.languages
        
        if (appLanguages.first(where: {$0 == deviceLang}) == nil) {
            deviceLang = "en"
        }
        deviceLang = deviceLang.languageLongName
        UserDefaults.standard.setValue(deviceLang, forKey: "LANGUAGE")
        UserDefaults.standard.synchronize()
        debugPrint("<--- Application Language: \(deviceLang) --->")
    }
    
    func setLanguage(language: String) {
        window?.rootViewController?.view.removeFromSuperview()
        window?.rootViewController = nil
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { (timer) in
            UserDefaults.standard.setValue(language.languageLongName, forKey: "LANGUAGE")
            UserDefaults.standard.synchronize()
            Bundle.setLanguage(language)
            self.decideUserLoggedInStatusAndContinue()
        }
    }
    
    private func decideUserLoggedInStatusAndContinue() {
        let isUserLoggedIn: Bool = (UserDefaults.standard.string(forKey: "LOGGEDIN") ?? "0") == "1"
        isUserLoggedIn ? (handleStatusUserLoggedIn()) : (handleStatusGuest())
        debugPrint("<--- Is User already loggedin? \(isUserLoggedIn) --->")
    }
    
    private func handleStatusGuest() {
        let rootVC = SplashRouter().returnNC()
        
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
    }
    
    private func handleStatusUserLoggedIn() { }

    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Diverse_Social_Media")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
