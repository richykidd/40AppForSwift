//
//  InterestCollectionViewCell.swift
//  05-滚动视图
//
//  Created by Richy Li on 16/12/19.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    
    var interest: Interest! {
        didSet {
        
        updataUI()
        }
    
    }
    
    @IBOutlet weak var featuredImageView: UIImageView!
    
    @IBOutlet weak var interestTitleLabel: UILabel!
    
    fileprivate func updataUI(){
    
        interestTitleLabel.text = interest.title
        featuredImageView.image = interest.featuredImage
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
}
