//
//  FifthViewController.swift
//  25-五种动画效果
//
//  Created by Richy Li on 16/12/27.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func spin(){
      
        UIView.animate(withDuration: 0.8, delay: 0, options: .curveLinear, animations: {
            self.firstImage.transform = self.firstImage.transform.rotated(by: (CGFloat(M_PI)))
            self.secondImage.transform = self.secondImage.transform.rotated(by: CGFloat(M_PI))
            self.nameLabel.transform = self.nameLabel.transform.rotated(by: (CGFloat(M_PI)))
        }, completion:{ (finished) in
            
            self.spin()
            
        })

    
    
    
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.spin()
    }

}
