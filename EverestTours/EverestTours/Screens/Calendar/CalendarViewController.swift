//
//  CalendarViewController.swift
//  EverestTours
//
//  Created by kevin on 12/14/18.
//  Copyright © 2018 Avantica Mobile. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CalendarViewController: UIViewController {
    
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    
    var calendarDateRage: DateRage? = CalendarConstants.calendarDateRage
    var date: Date?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarView.visibleDates { (visibleDates) in
            self.setDateLabels(visibleDates)
        }
    }
    
    func setDateLabels(_ visibleDates: DateSegmentInfo) {
        let currentDate = visibleDates.monthDates.first!.date
        yearLabel.text = AppDateFormatter.getYearName(of: currentDate.millisecondsSince1970)
        monthLabel.text = AppDateFormatter.getMonthName(of: currentDate.millisecondsSince1970)
    }
    
    func presentTourList(for date: Date) {
        if let startDate = calendarDateRage?.startDate, let endDate = calendarDateRage?.endDate {
            if date.compare(startDate) == .orderedDescending && date.compare(endDate) == .orderedAscending {
                self.date = date
                performSegue(withIdentifier: CalendarConstants.segueToTourList, sender: self)
            } else {
                //TODO: warning non permited dates
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == CalendarConstants.segueToTourList {
            let tourListViewController = segue.destination as! TourListViewController
            tourListViewController.date = date
        }
    }
}

extension CalendarViewController: JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource {
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        let parameters = ConfigurationParameters(startDate: calendarDateRage?.startDate ?? Date(), endDate: calendarDateRage?.endDate ?? Date())
        return parameters
    }
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        let calendarCell = cell as! CalendarCell
        calendarCell.configure(withCellState: cellState, andDate: date)
        
    }
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let calendarCell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: CalendarCell.identifier, for: indexPath) as! CalendarCell
        calendarCell.configure(withCellState: cellState, andDate: date)
        return calendarCell
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        let calendarCell = cell as! CalendarCell
        calendarCell.updateColors(withCellState: cellState)
        presentTourList(for: date)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        let calendarCell = cell as? CalendarCell
        calendarCell?.updateColors(withCellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        setDateLabels(visibleDates)
    }
}
