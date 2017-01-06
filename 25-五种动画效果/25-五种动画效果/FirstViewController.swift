//
//  FirstViewController.swift
//  25-五种动画效果
//
//  Created by Richy Li on 16/12/27.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
          }

    func setHeight(_ height:CGFloat) {
        var frame:CGRect = self.thirdView.frame
        frame.size.height = height
        self.thirdView.frame = frame
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.8, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: UIViewAnimationOptions(), animations: { 
            self.firstView.center.x = self.view.bounds.width - self.firstView.center.x
            self.firstView.center.y = self.firstView.center.y + 30
            self.secondView.center.x = self.view.bounds.width - self.secondView.center.x
            self.secondView.center.y = self.secondView.center.y + 30
        }, completion: nil)
        
        UIView.animate(withDuration: 0.6, delay: 0.4, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: .curveEaseOut, animations: { 
            self.setHeight(80)
            self.thirdView.center.y = self.view.bounds.height - self.thirdView.center.y
        }, completion: nil)
    }
   
}
