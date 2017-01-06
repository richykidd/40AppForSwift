//
//  DetailViewController.swift
//  39-缩放视图
//
//  Created by Richy Li on 17/1/5.
//  Copyright © 2017年 richyli. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, ZoomingIconViewController{

    var item: SocialItem?
    
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var coloredView: UIView!
    
    
    @IBOutlet weak var backButtonTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var summaryLabelBottomConstraint: NSLayoutConstraint!
    
    @IBAction func handleBackButton(_ sender: UIButton) {
        navigationController!.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        if let item = item {
        
            coloredView.backgroundColor = item.color
            imageView.image = item.image
            titleLabel.text = item.name
            summaryLabel.text = item.summary
        
        } else{
        
            coloredView.backgroundColor = UIColor.gray
            imageView.image = nil
            titleLabel.text = nil
            summaryLabel.text = nil
        }
      
    }

    func setupState(_ initial: Bool)  {
        if initial {
        backButtonTopConstraint.constant = -64
            summaryLabelBottomConstraint.constant = -200
        
        } else {
        
            backButtonTopConstraint.constant = 0
            summaryLabelBottomConstraint.constant = 80
        }
        view.layoutIfNeeded()
    }
    func zoomingIconTransition(_ transition: ZoomingIconTransition, willAnimateTransitionWithOperation operation: UINavigationControllerOperation, isForegroundViewController isForeground: Bool) {
        setupState(operation == .push)
        UIView.animate(withDuration: 0.6, delay: operation == .push ? 0.2 : 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [], animations: { 
            self.setupState(operation == .pop)
        }, completion: nil)
    }
    func zoomingIconColoredViewForTransition(_ transition: ZoomingIconTransition) -> UIView! {
        return coloredView
    }

    func zoomingIconImageViewForTransition(_ transition: ZoomingIconTransition) -> UIImageView! {
        return imageView
    }
}
