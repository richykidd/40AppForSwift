//
//  SecondViewController.swift
//  27-Tabbar
//
//  Created by Richy Li on 16/12/28.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var proImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

       navigationController?.isNavigationBarHidden = true
        self.proImage.alpha = 0
        self.proImage.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: { 
            self.proImage.alpha = 1
            self.proImage.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
    }
    override func viewDidAppear(_ animated: Bool) {
      UIView.animate(withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: { 
        self.proImage.alpha = 0
        self.proImage.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
      }) { (finished) in
        self.viewWillAppear(true)
        }
  
}
}
