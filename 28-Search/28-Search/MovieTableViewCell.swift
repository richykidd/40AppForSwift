//
//  MovieTableViewCell.swift
//  28-Search
//
//  Created by Richy Li on 16/12/29.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var imgMovieImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblRating.layer.cornerRadius = lblRating.frame.size.width / 2
        lblRating.layer.masksToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
