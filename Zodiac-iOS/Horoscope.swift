//
//  Horoscope.swift
//  Zodiac-iOS
//
//  Created by Mañanas on 12/5/25.
//

import Foundation
import UIKit

struct Horoscope {
    
    let id: String
    let name: String
    let dates: String
    let image: UIImage
    
    
    
    private static let horoscopeList = [
        Horoscope(id: "aries", name: "Aries", dates: "March 21 to April 19", image: UIImage(named: "horoscope-icons/aries")!),
        Horoscope(id: "taurus", name: "Taurus", dates: "April 20 to May 20", image: UIImage(named: "horoscope-icons/taurus")!),
        Horoscope(id: "gemini", name: "Gemini", dates: "May 21 to June 20", image: UIImage(named: "horoscope-icons/gemini")!),
        Horoscope(id: "cancer", name: "Cancer", dates: "June 21 to July 22", image: UIImage(named: "horoscope-icons/cancer")!),
        Horoscope(id: "leo", name: "Leo", dates: "June 21 to July 22", image: UIImage(named: "horoscope-icons/leo")!),
        Horoscope(id: "virgo", name: "Virgo", dates: "August 23 to September 22", image: UIImage(named: "horoscope-icons/virgo")!),
        Horoscope(id: "libra", name: "Libra", dates: "September 23 to October 22", image: UIImage(named: "horoscope-icons/libra")!),
        Horoscope(id: "scorpio", name: "Scorpio", dates: "October 23 to November 21", image: UIImage(named: "horoscope-icons/scorpio")!),
        Horoscope(id: "sagittarius", name: "Sagittarius", dates: "November 22 to December 21", image: UIImage(named: "horoscope-icons/sagittarius")!),
        Horoscope(id: "capricorn", name: "Capricorn", dates: "December 22 to January 19", image: UIImage(named: "horoscope-icons/capricorn")!),
        Horoscope(id: "aquarius", name: "Aquarius", dates: "January 20 to February 18", image: UIImage(named: "horoscope-icons/aquarius")!),
        Horoscope(id: "pisces", name: "Pisces", dates: "February 19 to March 20", image: UIImage(named: "horoscope-icons/pisces")!)
    ]
    
    static func getAll() -> [Horoscope] {
        return horoscopeList
    }
    
}
