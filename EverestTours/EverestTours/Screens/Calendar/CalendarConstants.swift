//
//  CalendarConstants.swift
//  EverestTours
//
//  Created by kevin on 12/14/18.
//  Copyright © 2018 Avantica Mobile. All rights reserved.
//

import Foundation
import UIKit

struct CalendarConstants {
    static let segueToTourList = "toTourList"

    static let selectedDateCellColor = #colorLiteral(red: 0.000655818806, green: 0.1154483991, blue: 0.230964467, alpha: 1)
    static let deselectedDateCellColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    static let calendarDateRage: DateRage = (startDate: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date(), endDate: Calendar.current.date(byAdding: .month, value: 1, to: Date()) ?? Date())
    
}
