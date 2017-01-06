//
//  TableViewCell.swift
//  21-单元格事件
//
//  Created by Richy Li on 16/12/26.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit
struct pattern {
    let image: String
    let name: String
}
class TableViewCell: UITableViewCell {

    @IBOutlet weak var patternImageView: UIImageView!
    
    @IBOutlet weak var patternLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
