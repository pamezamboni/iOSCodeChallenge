//
//  Int+Extensions.swift
//  iOSCodeChallenge
//
//  Created by Pamela Zamboni on 11/04/2019.
//  Copyright © 2019 Pamela Zamboni. All rights reserved.
//

import UIKit

extension Int {
    func secondsToYearsMonthsDaysHoursMinutesSeconds() -> (Int, Int, Int, Int, Int, Int) {
        return (self / 84600 / 30 / 365, self / 84600 / 30, self / 84600, self / 3600, (self % 3600) / 60, (self % 3600) % 60)
    }
    
    func correctSinceDateString() -> String {
        let (y, M, d, h, m, s) = secondsToYearsMonthsDaysHoursMinutesSeconds()
        var stringDate: String = ""
        if y != 0 {
            stringDate = "\(y) \(y == 1 ? "year" : "years")"
        } else if M != 0 {
            stringDate = "\(M) \(M == 1 ? "month" : "months")"
        } else if d != 0 {
            stringDate = "\(d) \(d == 1 ? "day" : "days")"
        } else if h != 0 {
            stringDate = "\(h)h"
        } else if m != 0 {
            stringDate = "\(m)m"
        } else if s != 0 {
            stringDate = "\(s)s"
        }
        let fullStringDate = !stringDate.isEmpty ? "\(stringDate) ago" : "now"
        return fullStringDate
        
    }
}
