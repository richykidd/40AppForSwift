//
//  ViewController.swift
//  34- 底部菜单点击弹出
//
//  Created by Richy Li on 17/1/3.
//  Copyright © 2017年 richyli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var wechatView: UIView!
    @IBOutlet weak var wechatLabel: UILabel!
    @IBOutlet weak var wechatImageView: UIImageView!
    
    @IBOutlet weak var qqView: UIView!
    @IBOutlet weak var qqImageView: UIImageView!
    @IBOutlet weak var qqLabel: UILabel!
    
   
    @IBOutlet weak var weiboView: UIView!
    @IBOutlet weak var weiboImageView: UIImageView!
    
    @IBOutlet weak var weiboLabel: UILabel!
    
    @IBOutlet weak var floatingButtonImageView: UIImageView!
    
    @IBOutlet weak var QQToWechat: NSLayoutConstraint!
    @IBOutlet weak var WeiboToQQ: NSLayoutConstraint!
    @IBOutlet weak var ButtonToWeibo: NSLayoutConstraint!
    
    
    var floatingButtonIsActive: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        initFloatingButton()
        
    }
    
    @IBAction func didTouchUp(_ sender: UIButton) {
        
        floatingButtonDidTouched()
    }
    func initFloatingButton(){
    
        floatingButtonImageView.layer.cornerRadius = floatingButtonImageView.frame.width / 2
        wechatImageView.layer.cornerRadius = wechatImageView.frame.width / 2
        qqImageView.layer.cornerRadius = qqImageView.frame.width / 2
        weiboImageView.layer.cornerRadius = weiboImageView.frame.width / 2
        
        qqView.isHidden = true
        weiboView.isHidden = true
        wechatView.isHidden = true
        
        qqLabel.alpha = 0
        weiboLabel.alpha = 0
        wechatLabel.alpha = 0

        QQToWechat.constant = 0
        WeiboToQQ.constant = 0
        ButtonToWeibo.constant = 0
    
    }

    func floatingButtonDidTouched(){
    
        if !floatingButtonIsActive {
        
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 5, options: UIViewAnimationOptions(), animations: { 
                
                self.wechatView.isHidden = false
                self.qqView.isHidden = false
                self.weiboView.isHidden = false
                
                self.wechatLabel.alpha = 1
                self.qqLabel.alpha = 1
                self.weiboLabel.alpha = 1
                self.floatingButtonImageView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_4))
                self.WeiboToQQ.constant += 30
                self.ButtonToWeibo.constant += 30
                self.QQToWechat.constant += 30
                self.view.layoutIfNeeded()
            }, completion: { (_) in
                self.floatingButtonIsActive = true
            })
        
        } else {
        
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: UIViewAnimationOptions(), animations: { 
                self.wechatView.center.y = self.qqView.center.y
                self.wechatLabel.alpha = 0
                self.view.layoutIfNeeded()
            }, completion: { (_) in
                
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: UIViewAnimationOptions(), animations: { 
                    self.wechatView.center.y = self.weiboView.center.y
                    self.qqView.center.y = self.weiboView.center.y
                    self.qqLabel.alpha = 0
                    self.view.layoutIfNeeded()
                }, completion: { (_) in
                    
                    UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: UIViewAnimationOptions(), animations: { 
                        self.wechatView.center.y = self.floatingButtonImageView.center.y
                        self.qqView.center.y = self.floatingButtonImageView.center.y
                        self.weiboView.center.y = self.floatingButtonImageView.center.y
                        self.weiboLabel.alpha = 0
                        self.view.layoutIfNeeded()

                    }, completion: { (_) in
                        
                        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 5, options: UIViewAnimationOptions(), animations: { 
                            self.floatingButtonImageView.transform = CGAffineTransform.identity
                        }, completion: { (_) in
                            
                            self.ButtonToWeibo.constant = 0
                            self.WeiboToQQ.constant = 0
                            self.QQToWechat.constant = 0
                            self.view.layoutIfNeeded()
                            
                            self.qqView.isHidden = true
                            self.weiboView.isHidden = true
                            self.wechatView.isHidden = true
                            
                            self.floatingButtonIsActive = false

                        })
                    })
                })
            })
        
        
        
        }
    
    }

}

