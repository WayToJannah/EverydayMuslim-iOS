//
//  BanglaDate.swift
//  EverydayMuslim
//
//  Created by Shahriar Nasim Nafi on 21/3/21.
//

import Foundation

/// Convert English date to Bangla date. This is only for Bangladesh. WestBengla have different method
struct BanglaDate {
    private let date: Date
    private let calendar = Calendar(identifier: .gregorian)
    private let dateComponents: DateComponents
    private let timeZone = TimeZone(identifier: "Asia/Dhaka")!
    private let banglaMonths = ["বৈশাখ","জ্যৈষ্ঠ", "আষাঢ়","শ্রাবণ","ভাদ্র", "আশ্বিন","কার্তিক","অগ্রহায়ণ","পৌষ","মাঘ", "ফাল্গুন","চৈত্র"]
    private let banglaSeasons = ["গ্রীষ্ম", "বর্ষা", "শরৎ", "হেমন্ত", "শীত", "বসন্ত"]
    private let banglaWeek = ["রবিবার", "সোমবার", "মঙ্গলবার",  "বুধবার", "বৃহস্পতিবার", "শুক্রবার", "শনিবার"]
    private var totalDaysInMonth = [31, 31, 31, 31, 31, 31, 30, 30, 30, 30, 30, 30];
    
    /// Bangla day: ১
    var day: String = ""
    /// Bangla week: সোমবার
    var week: String = ""
    /// Bangla month:  আষাঢ়
    var month: String = ""
    /// Bangla year: ১৪২৭
    var year: String = ""
    /// Bangla season: শরৎ
    var season: String = ""
    /// Bangla full date: ৮ চৈত্র, ১৪২৭
    var banglaDate: String = ""
    
    
    
    init(){
        date = Date()
        dateComponents = calendar.dateComponents(in: timeZone, from: date)
        toBanglaDate()
    }
    
    init?(dateMonthYear: DateMonthYear) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        guard let date = formatter.date(from: "\(dateMonthYear.year)/\(dateMonthYear.month)/\(dateMonthYear.day) 00:00")
        else { return nil }
        self.date = date
        dateComponents = calendar.dateComponents(in: timeZone, from: date)
        toBanglaDate()
        
    }
    
    private func isLeapYear(for year: Int) -> Bool {
        return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
    }
    
    static func differences(startDate: DateMonthYear, endDate: DateMonthYear) -> Int {
        let calendar = Calendar(identifier: .gregorian)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let fromDate = calendar.startOfDay(for: formatter.date(from: "\(startDate.year)/\(startDate.month)/\(startDate.day) 00:00")!)
        let toDate = calendar.startOfDay(for: formatter.date(from: "\(endDate.year)/\(endDate.month)/\(endDate.day) 00:00")!)
        let components = calendar.dateComponents([.day], from: fromDate, to: toDate)
        return abs(components.day!)
    }
    
    private mutating func toBanglaDate() {
        let year = dateComponents.year!
        let month = dateComponents.month!
        let day = dateComponents.day!
        if(isLeapYear(for: year)) {
            totalDaysInMonth[10] = 30
        } else {
            totalDaysInMonth[10] = 29
        }
        let banglaYear =
            (month < 4 || (month == 4 && day < 14)) ? year - 594 : year - 593;
        let epochYear =
            (month < 4 || (month == 4 && day < 14)) ? year - 1 : year;
        var difference = BanglaDate.differences(startDate: DateMonthYear(day: day, month: month, year: year), endDate: DateMonthYear(day: 13, month: 4, year: epochYear))
        var banglaMonthIndex = 0;
        for i in 0..<banglaMonths.count {
            if (difference <= totalDaysInMonth[i]) {
                banglaMonthIndex = i;
                break;
            }
            difference -= totalDaysInMonth[i];
        }
        let banglaDate = difference;
        let weekComponent = calendar.dateComponents(in: timeZone, from: date)
        let banglaWeekIndex = weekComponent.weekday!
        self.day = Util.toBangla(of: String(banglaDate))
        self.week = banglaWeek[banglaWeekIndex - 1]
        self.month = banglaMonths[banglaMonthIndex]
        self.season = banglaSeasons[(banglaMonthIndex / 2)]
        self.year = Util.toBangla(of: String(banglaYear))
        self.banglaDate = "\(self.day) \(self.month), \(self.year)"
    }
}

struct DateMonthYear {
    let day: Int
    let month: Int
    let year: Int
}
