//
//  TopViewController.swift
//  24-图片左右滑动
//
//  Created by Richy Li on 16/12/31.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {

    @IBAction func left(_ sender: UISwipeGestureRecognizer) {
        self.performSegue(withIdentifier: "toMiddle", sender: .none)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
