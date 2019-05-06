//
//  AppDateFormatter.swift
//  EverestTours
//
//  Created by kevin on 12/14/18.
//  Copyright © 2018 Avantica Mobile. All rights reserved.
//

import Foundation

class AppDateFormatter {
    static var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        return formatter
    }()

    class func getDate(for date: String) -> Double? {
        formatter.dateFormat = AppDateFormatterConstants.fullDateFormat
        return formatter.date(from: date)?.millisecondsSince1970
    }
    
    class func getShortDateName(for date: Double) -> String {
        formatter.dateFormat = AppDateFormatterConstants.fullDateFormat
        return formatter.string(from: Date(milliseconds: date))
    }
    
    class func getYearName(of date: Double) -> String? {
        formatter.dateFormat = AppDateFormatterConstants.yearNameFormat
        return formatter.string(from: Date(milliseconds: date))
    }
    
    class func getMonthName(of date: Double) -> String {
        formatter.dateFormat = AppDateFormatterConstants.monthNameFormat
        return formatter.string(from: Date(milliseconds: date))
    }
    
    class func getHourString(of date: Double) -> String {
        formatter.dateFormat = AppDateFormatterConstants.hourStringFormat
        return formatter.string(from: Date(milliseconds: date))
    }
}
