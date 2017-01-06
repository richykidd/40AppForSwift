//
//  SecondViewController.swift
//  25-五种动画效果
//
//  Created by Richy Li on 16/12/27.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var backImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 2) { 
            self.backImage.alpha = 0
        }
    }}
