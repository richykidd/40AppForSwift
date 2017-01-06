//
//  ViewController.swift
//  18-收起键盘
//
//  Created by Richy Li on 16/12/25.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var tweetTextView: UITextView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var bottomUIView: UIView!
    @IBOutlet weak var characterCountLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTextView.delegate = self
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyBoardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyBoardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
           }
    
    

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let myTextViewSring = tweetTextView.text
        characterCountLabel.text = "\(140 - (myTextViewSring?.characters.count)!)"
        
        if range.length > 140{
        
            return false
        }
        let newLength = (myTextViewSring?.characters.count)! + range.length
        
        return newLength < 140
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    func keyBoardWillShow(_ note:Notification){
    
        let userInfo = note.userInfo
        let keyBoardBounds = (userInfo?[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let duration = (userInfo?[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).doubleValue
        let deltaY = keyBoardBounds.size.height
        let animations:(() -> Void) = {
        
        self.bottomUIView.transform = CGAffineTransform(translationX: 0, y: -deltaY)
        }
        if duration > 0 {
        
            let options = UIViewAnimationOptions(rawValue: UInt((userInfo?[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).intValue << 16))
            
            UIView.animate(withDuration: duration, delay: 0, options: options, animations: animations, completion: nil)
        } else {
        animations()
        }
    }
    
    func keyBoardWillHide(_ note:Notification)  {
        let userInfo = note.userInfo
        let duration = (userInfo?[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        let animations: (() -> Void) = {
        
            self.bottomUIView.transform = CGAffineTransform.identity
        }
        if duration > 0 {
        
            let options = UIViewAnimationOptions(rawValue:UInt((userInfo?[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).intValue << 16))
            UIView.animate(withDuration: duration, delay: 0, options: options, animations: animations, completion: nil)
        } else {
        
            animations()
        }
    }
}

