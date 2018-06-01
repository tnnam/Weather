//
//  Weather.swift
//  DemoWeatherAPI2
//
//  Created by Tran Ngoc Nam on 5/31/18.
//  Copyright © 2018 Tran Ngoc Nam. All rights reserved.
//

import UIKit

class Weather {
    var name: String
    var temp_c: Double
    var text: String
    var icon: String
    var forecastDay: [ForecastDay] = []
    
    init?(dictionary: JSON) {
        guard let location = dictionary["location"] as? JSON else { return nil }
        guard let name = location["name"] as? String else { return nil }
        guard let current = dictionary["current"] as? JSON else { return nil }
        guard let temp_c = current["temp_c"] as? Double else { return nil }
        guard let condition = current["condition"] as? JSON else { return nil }
        guard let text = condition["text"] as? String else { return nil }
        guard let icon = condition["icon"] as? String else { return nil }
        guard let forecast = dictionary["forecast"] as? JSON else { return nil }
        guard let forecastday = forecast["forecastday"] as? [JSON] else { return nil }
        for object in forecastday {
            guard let data = ForecastDay(dictionary: object) else { return nil }
            self.forecastDay.append(data)
        }
        
        self.name = name
        self.temp_c = temp_c
        self.text = text
        self.icon = "https:" + icon
    }
    
}
