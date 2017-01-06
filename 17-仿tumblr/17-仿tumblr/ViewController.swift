//
//  ViewController.swift
//  17-仿tumblr
//
//  Created by Richy Li on 16/12/24.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func push(_ sender: Any) {
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

 

    @IBAction func unwindToViewController (_ sender: UIStoryboardSegue){
        self.dismiss(animated: true, completion: nil)
    }
}

