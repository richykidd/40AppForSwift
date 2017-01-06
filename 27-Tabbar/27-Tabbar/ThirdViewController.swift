//
//  ThirdViewController.swift
//  27-Tabbar
//
//  Created by Richy Li on 16/12/28.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var exploreImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true
       self.exploreImage.alpha = 0
        self.exploreImage.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: { 
            self.exploreImage.alpha = 1
            self.exploreImage.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
    }

}
