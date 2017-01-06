//
//  NewsTableViewCell.swift
//  16-菜单
//
//  Created by Richy Li on 16/12/23.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postAuthor: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        authorImageView.layer.cornerRadius = 20
        authorImageView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
