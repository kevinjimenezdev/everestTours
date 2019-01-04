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

    class func getDate(for date: String) -> Date? {
        formatter.dateFormat = AppDateFormatterConstants.fullDateFormat
        return formatter.date(from: date)
    }
    
    class func getYearName(of date: Date) -> String {
        formatter.dateFormat = AppDateFormatterConstants.yearNameFormat
        return formatter.string(from: date)
    }
    
    class func getMonthName(of date: Date) -> String {
        formatter.dateFormat = AppDateFormatterConstants.monthNameFormat
        return formatter.string(from: date)
    }
    
    class func getHourString(of date: Date) -> String {
        formatter.dateFormat = AppDateFormatterConstants.hourStringFormat
        return formatter.string(from: date)
    }
}
