//
//  AppBox.swift
//  EverydayMuslim
//
//  Created by Shahriar Nasim Nafi on 23/3/21.
//

import Foundation
import MapKit
import Adhan

class AppBox {
    static let shared = AppBox()
    
    static var timeZone: TimeZone? = nil
    static var coodinate: CLLocation? = nil
    static var placeName: String? = nil
    static var isoCountryCode: String? = nil
    static var calculationMethod: CalculationMethod? = nil
    static var madhab: Madhab = .hanafi
    
}
