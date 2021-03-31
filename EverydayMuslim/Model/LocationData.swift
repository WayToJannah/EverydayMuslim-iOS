//
//  LocationData.swift
//  EverydayMuslim
//
//  Created by Shahriar Nasim Nafi on 22/3/21.
//

import Foundation
import MapKit

/// Get Place infos from latitude and longitube by `MapKit`
class LocationData {
    /// `LocationData` shared object
    static let shared = LocationData()
    
    static var cityName: String? = nil
    static var isoCountryCode: String? = nil
    static var countryName: String? = nil
    static var timeZone: TimeZone? = nil
    static var location: CLLocation? = nil
    
    /// Get Geocode data in .userInitiated queue and update UI in main thread
    /// - Parameters:
    ///   - onStart :Show Loading Status
    ///   - onFinish :Update UI
    
    static func getPlaceInfos(onStart: () -> (), onFinish: @escaping () -> ()) {
        guard let location = location else { return }
        onStart()
        DispatchQueue.global(qos: .userInitiated).async {
            location.fetchPlaceInfo { (placemark, error) in
                guard let city = placemark?.locality,let country = placemark?.country,let isoCountryCode = placemark?.isoCountryCode, let timeZone = placemark?.timeZone, error == nil else { return }
                self.cityName = city
                self.countryName = country
                self.isoCountryCode = isoCountryCode
                self.timeZone = timeZone
                DispatchQueue.main.async {
                    onFinish()
                }
            }
        }
    }
}
