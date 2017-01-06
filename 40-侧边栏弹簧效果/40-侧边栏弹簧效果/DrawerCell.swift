//
//  DrawerCell.swift
//  40-侧边栏弹簧效果
//
//  Created by Richy Li on 17/1/5.
//  Copyright © 2017年 richyli. All rights reserved.
//

import UIKit
struct Player {
    let name: String
    let pic: String
    init(name:String,pic:String) {
        self.name = name
        self.pic = pic
    }
}
class DrawerCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var playerImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
