//
//  OtherViewController.swift
//  12-登录界面动画
//
//  Created by Richy Li on 16/12/22.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit

class OtherViewController: UIViewController, UITextFieldDelegate{

    
    @IBAction func backVC(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var centerUsername: NSLayoutConstraint!
    
    @IBOutlet weak var centerPassword: NSLayoutConstraint!
    
    @IBOutlet weak var loginBtnOV: UIButton!
    
    
    @IBAction func touchUp(_ sender: UIButton) {
      
        let bounds = self.loginBtnOV.bounds
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveLinear, animations: { 
            self.loginBtnOV.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 20, height: bounds.size.height)
        }) { finished in self.loginBtnOV.isEnabled = true }
        
    }
       func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
       
        return true;
    }

       
        
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        username.layer.cornerRadius = 5
        password.layer.cornerRadius = 5
        loginBtnOV.layer.cornerRadius = 5
        username.delegate = self
        password.delegate = self
       
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        centerUsername.constant -= view.bounds.width
        centerPassword.constant -= view.bounds.width
        loginBtnOV.alpha = 0
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, delay: 0.00, options: .curveEaseOut, animations: { 
            self.centerUsername.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.10, options: .curveEaseOut, animations: { 
            self.centerPassword.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.20, options: .curveEaseOut, animations: { 
            self.loginBtnOV.alpha = 1
        }, completion: nil)
    }

}
