//
//  CalculationMethod+Ex.swift
//  EverydayMuslim
//
//  Created by Shahriar Nasim Nafi on 21/3/21.
//

import Adhan
import Foundation


extension CalculationMethod {
    public init(rawValue: Int) {
        switch rawValue {
        case 0:
            self = .muslimWorldLeague
        case 1:
            self = .egyptian
        case 2:
            self = .karachi
        case 3:
            self = .ummAlQura
        case 4:
            self = .dubai
        case 5:
            self = .moonsightingCommittee
        case 6:
            self = .northAmerica
        case 7:
            self = .kuwait
        case 8:
            self = .qatar
        case 9:
            self = .singapore
        case 10:
            self = .tehran
        case 11:
            self = .turkey
        default:
            self = .other
        }
    }
    
    public var intRawValue: Int {
        switch self {
        case .muslimWorldLeague:
            return 0
        case .egyptian:
            return 1
        case .karachi:
            return 2
        case .ummAlQura:
            return 3
        case .dubai:
            return 4
        case .moonsightingCommittee:
            return 5
        case .northAmerica:
            return 6
        case .kuwait:
            return 7
        case .qatar:
            return 8
        case .singapore:
            return 9
        case .tehran:
            return 10
        case .turkey:
            return 11
        case .other:
            return 12
        }
    }
}


