//
//  SceneryCell.swift
//  37-拉伸视图
//
//  Created by Richy Li on 17/1/4.
//  Copyright © 2017年 richyli. All rights reserved.
//

import UIKit
struct Scenery {
    let image: String
    let name: String
    let summary: String
    let nameColor: UIColor
    
    init(image: String, name: String, summary: String, nameColor: UIColor) {
        self.image = image
        self.name = name
        self.summary = summary
        self.nameColor = nameColor
    }
}
class SceneryCell: UITableViewCell {

    @IBOutlet weak var sceneImage: UIImageView!
    
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
