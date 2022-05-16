//
//  KeyForUsersDefaulds.swift
//  FindNumber
//
//  Created by Valery on 15/05/2022.
//

import Foundation


enum KeysUserDefaulds {
    static let settingGame = "settingGame"
    static let recordGame = "recordGame"
}

struct SettingsGame: Codable {
    var timerState: Bool
    var timeForGame: Int
}

class Settings {
    
    static var shared = Settings()
    
    private let defaultSettings = SettingsGame(timerState: true, timeForGame: 30)
    
    var currentSettings: SettingsGame{
        get {
            if let data = UserDefaults.standard.object(forKey: KeysUserDefaulds.settingGame) as? Data {
                return try! PropertyListDecoder().decode(SettingsGame.self, from: data)
            } else {
                if let data = try? PropertyListEncoder().encode(defaultSettings) {
                    UserDefaults.standard.set(data, forKey: KeysUserDefaulds.settingGame)
                }
                return defaultSettings
            }
        }
        
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                UserDefaults.standard.set(data, forKey: KeysUserDefaulds.settingGame)
            }
        }
    }
    
    func resetSettings() {
        currentSettings = defaultSettings
    }
}
