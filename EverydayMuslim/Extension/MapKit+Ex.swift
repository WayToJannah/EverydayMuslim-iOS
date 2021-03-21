//
//  MapKit+Ex.swift
//  EverydayMuslim
//
//  Created by Shahriar Nasim Nafi on 22/3/21.
//

import Foundation
import MapKit

extension CLLocation {
    func fetchPlaceInfo(completion: @escaping (_ placemark: CLPlacemark?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first, $1) }
    }
}
