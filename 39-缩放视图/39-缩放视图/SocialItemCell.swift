//
//  SocialItemCell.swift
//  39-缩放视图
//
//  Created by Richy Li on 17/1/5.
//  Copyright © 2017年 richyli. All rights reserved.
//

import UIKit

struct SocialItem {
    let image: UIImage?
    let color: UIColor
    let name: String
    let summary: String
}

class SocialItemCell: UICollectionViewCell {
    @IBOutlet weak var coloredView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    var item: SocialItem? {
        didSet {
        
            if let item = item {
            
                coloredView.backgroundColor = item.color
                imageView.image = item.image
            }
        }
    
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        coloredView.layer.cornerRadius = bounds.width / 2
        coloredView.layer.masksToBounds = true
    }
}
