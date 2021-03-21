//
//  BanglaUtil.swift
//  EverydayMuslim
//
//  Created by Shahriar Nasim Nafi on 21/3/21.
//

import Foundation

struct Util {
   static func toBangla(of string: String) -> String {
        let replaced = string
            .replacingOccurrences(of: "0", with: "০")
            .replacingOccurrences(of: "1", with: "১")
            .replacingOccurrences(of: "2", with: "২")
            .replacingOccurrences(of: "3", with: "৩")
            .replacingOccurrences(of: "4", with: "৪")
            .replacingOccurrences(of: "5", with: "৫")
            .replacingOccurrences(of: "6", with: "৬")
            .replacingOccurrences(of: "7", with: "৭")
            .replacingOccurrences(of: "8", with: "৮")
            .replacingOccurrences(of: "9", with: "৯")
        return replaced
    }
}
