//
//  CalendarCell.swift
//  EverestTours
//
//  Created by kevin on 12/14/18.
//  Copyright © 2018 Avantica Mobile. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CalendarCell: JTAppleCell {
    
    static let identifier = "CalendarCell"
    
    @IBOutlet weak var dateNumberLabel: UILabel!
    @IBOutlet weak var selectedBackground: UIView!
    @IBOutlet weak var modeBackground: UIView!
    
    var isCurrentMonthCell: Bool?
    var cellState: CellState?
    var date: Date?
    
    func configure(withCellState cellState: CellState, andDate date: Date) {
        dateNumberLabel.text = cellState.text
        updateColors(withCellState: cellState)
    }
    
    func updateColors(withCellState cellState: CellState) {
        if cellState.dateBelongsTo == .thisMonth {
            modeBackground.isHidden = true
            if cellState.isSelected {
                selectedBackground.isHidden = false
                dateNumberLabel.textColor = CalendarConstants.selectedDateCellColor
            } else {
                selectedBackground.isHidden = true
                dateNumberLabel.textColor = CalendarConstants.deselectedDateCellColor
            }
        } else {
            modeBackground.isHidden = false
        }
    }
}
