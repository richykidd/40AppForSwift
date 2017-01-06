//
//  ViewController.swift
//  30-自定义进度条
//
//  Created by Richy Li on 17/1/1.
//  Copyright © 2017年 richyli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var progressView: ProgressView!
    
    var currenProgress = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       progressLabel.text = "\(currenProgress)%"
        addButton.layer.cornerRadius = 30
        minusButton.layer.cornerRadius = 30
    }

    @IBAction func addProgress(_ sender: UIButton) {
        let num = Int(arc4random() % 10)
        currenProgress += num
        progressLabel.text = "\(currenProgress)%"
        if currenProgress >= 100 {
        
            currenProgress = 100
            progressLabel.text = "\(currenProgress)%"
        }
        progressView.setProgress(progressView.progress + num, animate: true, duration: 0.5)
    }
   
    @IBAction func minusProgress(_ sender: UIButton) {
        
        let num = Int(arc4random() % 10)
        
        currenProgress -= num
        progressLabel.text = "\(currenProgress)%"
        if currenProgress <= 0 {
        
            currenProgress = 0
            progressLabel.text = "\(currenProgress)%"
        
        }
        progressView.setProgress(progressView.progress - num, animate: true, duration: 0.5)
    }

}

