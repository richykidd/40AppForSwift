//
//  LaunchScreen.swift
//  36-启动画面3秒
//
//  Created by Richy Li on 17/1/3.
//  Copyright © 2017年 richyli. All rights reserved.
//

import UIKit

class LaunchScreenView: UIView {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    let statusBarHeight = UIApplication.shared.statusBarFrame.height
    
    let buttonWidth: CGFloat = 40
    let buttonHeight: CGFloat = 40
    
    var imageView: UIImageView?
    var skipButton: UIButton?
    var timer: Timer?
    
    var durationTime: Int = 0 {
        didSet{
        
            skipButton?.setTitle("跳过\n\(durationTime) s", for: UIControlState())
        
        }
    
    }
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        imageView?.isUserInteractionEnabled = true
        self.addSubview(imageView!)
        
        skipButton = UIButton(frame: CGRect(x: screenWidth - buttonWidth - 20, y: statusBarHeight  + 20, width: buttonWidth, height: buttonHeight))
        skipButton?.layer.cornerRadius = 20
        skipButton?.clipsToBounds = true
        skipButton?.backgroundColor = UIColor(red: 0.64, green: 0.74, blue: 0.64, alpha: 1)
        skipButton?.setTitleColor(UIColor.white, for: UIControlState())
        skipButton?.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        skipButton?.titleLabel?.numberOfLines = 2
        skipButton?.titleLabel?.textAlignment = .center
        skipButton?.addTarget(self, action: #selector(LaunchScreenView.dismissLaunchScreen), for: .touchUpInside)
        self.addSubview(skipButton!)
        
        startTimer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func dismissLaunchScreen() {
        stopTimer()
        UIView.animate(withDuration: 0.8, animations: { 
            self.alpha = 0
            self.transform = CGAffineTransform(scaleX: 2, y: 2)
        }, completion: nil)
    }
    func startTimer(){
    
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(LaunchScreenView.timerDecrease), userInfo: nil, repeats: true)
    
    }
    func timerDecrease(){
    
        if durationTime == 0 {
        dismissLaunchScreen()
        
        } else {
        
            durationTime -= 1
        }
    
    }
    func stopTimer(){
    
    
        timer?.invalidate()
        timer = nil
    
    }
    
    class func showLaunchScreen(_ duration: Int, bgImage: UIImage?) {
        let launchView = LaunchScreenView()
        launchView.durationTime = duration
        launchView.imageView?.image = bgImage
        UIApplication.shared.delegate?.window!!.addSubview(launchView)
    }
}
