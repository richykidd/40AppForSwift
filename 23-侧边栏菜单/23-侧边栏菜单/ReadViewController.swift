//
//  ReadViewController.swift
//  23-侧边栏菜单
//
//  Created by Richy Li on 16/12/26.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit

class ReadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        UIApplication.shared.isStatusBarHidden = true
        self.navigationController?.isNavigationBarHidden = true
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
