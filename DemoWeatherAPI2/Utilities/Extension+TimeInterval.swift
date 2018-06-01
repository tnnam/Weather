//
//  Extension+TimeInterval.swift
//  DemoWeatherAPI2
//
//  Created by Tran Ngoc Nam on 5/31/18.
//  Copyright © 2018 Tran Ngoc Nam. All rights reserved.
//

import Foundation

extension TimeInterval {
    
    func getCurrentDateTime(convert dateTimeInterval: TimeInterval) -> String{
        let formater = DateFormatter()
        // lay thu tư TimeInterval
        formater.dateFormat = "EEEE"
        // chuyen doi thanh tieng viet
        formater.locale = Locale(identifier: "vi-VN")
        // lay gio he thong
        let today = formater.string(from: Date(timeIntervalSince1970: dateTimeInterval))
        let date = Date()
        let currentDate = formater.string(from: date)
        return currentDate == today ? today : today
    }
}
