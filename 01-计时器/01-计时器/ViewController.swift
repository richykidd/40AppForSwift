//
//  ViewController.swift
//  01-计时器
//
//  Created by Richy Li on 16/12/16.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var pauseBtn: UIButton!
    
    var Counter = 0.0
    var Timer = Foundation.Timer()
    var IsPlaying = false
    
 override   var preferredStatusBarStyle: UIStatusBarStyle {
    return UIStatusBarStyle.lightContent
    }
    
    
    override func viewDidLoad() {
        timeLable.text = String(Counter)
        super.viewDidLoad()
      
    }
    @IBOutlet weak var timeLable: UILabel!

    @IBAction func resetBtn(_ sender: UIButton) {
       Timer.invalidate()
        IsPlaying = false
        Counter = 0
        timeLable.text = String(Counter)
        playBtn.isEnabled = true
        pauseBtn.isEnabled = true
        
    }
 
    @IBAction func playCount(_ sender: UIButton) {
        if (IsPlaying) { return}
        playBtn.isEnabled = false
        pauseBtn.isEnabled = true
        Timer = Foundation.Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)
        IsPlaying = true
        
    }

    @IBAction func pauseCount(_ sender: UIButton) {
        
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false
        Timer.invalidate()
        IsPlaying = false
        
    }
    
    
    func updateTime()  {
        Counter = Counter + 0.1
        timeLable.text = String(format: "%.1f", Counter)
    }
}

