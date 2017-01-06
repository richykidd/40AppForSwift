//
//  CarTableViewCell.swift
//  35-自动滚动视图
//
//  Created by Richy Li on 17/1/3.
//  Copyright © 2017年 richyli. All rights reserved.
//

import UIKit

struct Car {
    let country: String
    let brand: String
    init(country: String, brand: String) {
        self.country = country
        self.brand = brand
    }
}
class CarTableViewCell: UITableViewCell {

    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
