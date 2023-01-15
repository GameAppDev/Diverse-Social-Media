//
//  AppLanguageManager.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 10.01.2023.
//

import Foundation

final class AppLanguageManager {
    
    static let shared = AppLanguageManager()
    
    public var languages: [String] { get { return ["en", "de", "it"] } }
    public var languagesLongName: [String: String] { get { return ["en": "English", "de": "Deutsch", "it": "Italiano"] } }
    private var defaultLanguage: String { get { return languages[0] } }
    private var languageForKeyValue: String { get { return "LANGUAGE" } }
    
    public func setAppLanguageInitial() {
        var deviceLanguage: String = getAppLanguageInitial()
        
        if (languages.first(where: {$0 == deviceLanguage}) == nil) {
            deviceLanguage = defaultLanguage
        }
        setAppLanguageInitial(deviceLanguage)
    }
    
    private func getAppLanguageInitial() -> String {
        if let userDefaultsLanguage = UserDefaults.standard.string(forKey: languageForKeyValue) {
            return userDefaultsLanguage
        } else if let localeLanguage = Locale.current.languageCode {
            return localeLanguage
        } else {
            return defaultLanguage
        }
    }
    
    private func setAppLanguageInitial(_ language: String?) {
        guard let language = language else { return }
        debugPrint("<--- Application Initial Language: \(languagesLongName[language] ?? language) --->")
        
        UserDefaults.standard.setValue(language, forKey: languageForKeyValue)
        UserDefaults.standard.synchronize()
    }
    
    public func getAppLanguage() -> String {
        let language: String = UserDefaults.standard.string(forKey: languageForKeyValue) ?? defaultLanguage
        return languagesLongName[language] ?? language
    }
    
    public func setAppLanguage(_ language: String?) {
        guard let language = language else { return }
        debugPrint("<--- Application Language: \(languagesLongName[language] ?? language) --->")
        
        UserDefaults.standard.setValue(language, forKey: languageForKeyValue)
        UserDefaults.standard.synchronize()
        
        setBundleLanguage(with: language)
    }
    
    private func setBundleLanguage(with language: String) {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { (timer) in
            Bundle.setLanguage(language)
            AppRouter.shared.openApp()
        }
    }
}
