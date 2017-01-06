//
//  ThirdViewController.swift
//  25-五种动画效果
//
//  Created by Richy Li on 16/12/27.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    
    @IBOutlet weak var bgImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.bgImage.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.bgImage.transform = CGAffineTransform(scaleX: 2, y: 2)
            self.bgImage.alpha = 1
        }, completion: nil)
    }
 

}
