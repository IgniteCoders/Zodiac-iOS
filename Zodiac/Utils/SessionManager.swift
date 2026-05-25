//
//  SessionManager.swift
//  Zodiac
//
//  Created by Tardes on 25/5/26.
//

import Foundation

class SessionManager {
    
    static let FAVORITE_HOROSCOPE = "FAVORITE_HOROSCOPE"
    
    let userDefaults = UserDefaults.standard
    
    func setFavoriteHoroscope(id: String) {
        userDefaults.set(id, forKey: SessionManager.FAVORITE_HOROSCOPE)
    }
    
    func getFavoriteHoroscope() -> String {
        return userDefaults.string(forKey: SessionManager.FAVORITE_HOROSCOPE) ?? ""
    }
    
    func isFavoriteHoroscope(id: String) -> Bool {
        return getFavoriteHoroscope() == id
    }
}
