//
//  Horoscope.swift
//  Zodiac
//
//  Created by Tardes on 22/5/26.
//

import UIKit

struct Horoscope {
    let id: String
    let name: String
    let dates: String
    
    func getImage() -> UIImage {
        return UIImage(named: "horoscope-icons/\(id)-icon")!
    }
    
    
    static let getAll: [Horoscope] = [
        Horoscope(id: "aries", name: "Aries", dates: "21 March - 19 April"),
        Horoscope(id: "taurus", name: "Taurus", dates: "20 April - 20 May"),
        Horoscope(id: "gemini", name: "Gemini", dates: "21 May - 20 June"),
        Horoscope(id: "cancer", name: "Cancer", dates: "21 June - 22 July"),
        Horoscope(id: "leo", name: "Leo", dates: "23 July - 22 August"),
        Horoscope(id: "virgo", name: "Virgo", dates: "23 August - 22 September"),
        Horoscope(id: "libra", name: "Libra", dates: "23 September - 22 October"),
        Horoscope(id: "scorpio", name: "Scorpio", dates: "23 October - 21 November"),
        Horoscope(id: "sagittarius", name: "Sagittarius", dates: "22 November - 21 December"),
        Horoscope(id: "capricorn", name: "Capricorn", dates: "22 December - 19 January"),
        Horoscope(id: "aquarius", name: "Aquarius", dates: "20 January - 18 February"),
        Horoscope(id: "pisces", name: "Pisces", dates: "19 February - 20 March"),
    ]
        
}
