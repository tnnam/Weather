//
//  TableViewCell.swift
//  DemoWeatherAPI2
//
//  Created by Tran Ngoc Nam on 5/31/18.
//  Copyright © 2018 Tran Ngoc Nam. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var date_epoch: UILabel!
    @IBOutlet weak var maxtemp_c: UILabel!
    @IBOutlet weak var mintemp_c: UILabel!
    @IBOutlet weak var icon: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
