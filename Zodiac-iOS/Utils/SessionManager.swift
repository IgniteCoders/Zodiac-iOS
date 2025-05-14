//
//  SessionManager.swift
//  Zodiac-iOS
//
//  Created by Mañanas on 14/5/25.
//

import Foundation

class SessionManager {
    let defaults = UserDefaults.standard
    
    func setFavorite(id: String) {
        defaults.set(id, forKey: "FAVORITE_HOROSCOPE")
    }
    
    func getFavorite() -> String {
        return defaults.string(forKey: "FAVORITE_HOROSCOPE") ?? ""
    }
    
    func isFavorite(id: String) -> Bool {
        return id == getFavorite()
    }
}
