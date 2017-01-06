//
//  FriendViewController.swift
//  23-侧边栏菜单
//
//  Created by Richy Li on 16/12/26.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit

class FriendViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        UIApplication.shared.isStatusBarHidden = true
        self.navigationController?.isNavigationBarHidden = true
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }

 

}
