//
//  ViewController.swift
//  36-启动画面3秒
//
//  Created by Richy Li on 17/1/3.
//  Copyright © 2017年 richyli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
    
        LaunchScreenView.showLaunchScreen(3, bgImage: UIImage(named: "Aurora"))
    }
}

