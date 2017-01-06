//
//  MenuViewController.swift
//  17-仿tumblr
//
//  Created by Richy Li on 16/12/24.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    let transitionManager = MenuTransitionManager()
    
    @IBOutlet weak var textBtn: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var photoBtn: UIButton!
    @IBOutlet weak var photoLabel: UILabel!
    
    @IBOutlet weak var quoteBtn: UIButton!
    @IBOutlet weak var quoteLabel: UILabel!
    
    @IBOutlet weak var linkBtn: UIButton!
    @IBOutlet weak var linkLabel: UILabel!
    
    @IBOutlet weak var chatBtn: UIButton!
    @IBOutlet weak var chatLabel: UILabel!
    
    @IBOutlet weak var audioBtn: UIButton!
    @IBOutlet weak var audioLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.transitioningDelegate = self.transitionManager
           }

   

}
