//
//  ViewController.swift
//  12-登录界面动画
//
//  Created by Richy Li on 16/12/22.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginBtn.layer.cornerRadius = 5
        signupBtn.layer.cornerRadius = 5
    }

  
}

