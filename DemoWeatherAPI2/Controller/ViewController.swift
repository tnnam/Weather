//
//  ViewController.swift
//  DemoWeatherAPI2
//
//  Created by Tran Ngoc Nam on 5/31/18.
//  Copyright © 2018 Tran Ngoc Nam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var weatherForecastday: [ForecastDay] = []

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var temp_c: UILabel!
    @IBOutlet weak var text: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        NotificationCenter.default.addObserver(self, selector: #selector(updateData), name: Notification.Name.init("update"), object: nil)
        DataService.shared.getDataWeatherFromAPI()
    }

    @objc func updateData() {
        guard let data = DataService.shared.weather else { return }
        if data.name == "Hanoi" {
            name.text = "Hà Nội"
        }
        icon.download(from: data.icon)
        temp_c.text = "\(data.temp_c)º"
        text.text = data.text
        weatherForecastday = data.forecastDay
        tableView.reloadData()
    }
    
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherForecastday.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let weather = weatherForecastday[indexPath.row]
        
        cell.date_epoch.text = weather.date_epoch.getCurrentDateTime(convert: weather.date_epoch)
        cell.icon.download(from: weather.icon)
        cell.maxtemp_c.text = "\(weather.maxtemp_c)º"
        cell.mintemp_c.text = "\(weather.mintemp_c)º"
        return cell
    }
    
}

