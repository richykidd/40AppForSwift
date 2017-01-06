//
//  AnimationCollectionViewCell.swift
//  20-视图动画
//
//  Created by Richy Li on 16/12/25.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit

class AnimationCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var animationImageView: UIImageView!
    @IBOutlet weak var animationTextView: UITextView!
   
  
    
    var backButtonTapped: (() -> Void)?
    
    func prepareCell(_ viewModel: AnimationCellModel) {
        animationImageView.image = UIImage(named: viewModel.imagePath)
        animationTextView.isScrollEnabled = false
        backButton.isHidden = true
        addTapEventHandler()
    }
    
    func handleCellSelected() {
        animationTextView.isScrollEnabled = false
        backButton.isHidden = false
        self.superview?.bringSubview(toFront: self)
    }
    
    fileprivate func addTapEventHandler() {
        backButton.addTarget(self, action: #selector(AnimationCollectionViewCell.backButtonDidTouch(_:)), for: .touchUpInside)
    }
    
    func backButtonDidTouch(_ sender: UIGestureRecognizer) {
        backButtonTapped?()
    }
}
