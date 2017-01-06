//
//  ViewController.swift
//  14-PickView
//
//  Created by Richy Li on 16/12/23.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var emojiPickView: UIPickerView!
    
    @IBOutlet weak var goBtn: UIButton!
    @IBAction func touchUp(_ sender: UIButton) {
        emojiPickView.selectRow(Int(arc4random()) % 90 + 3, inComponent: 0, animated: true)
        emojiPickView.selectRow(Int(arc4random()) % 90 + 3, inComponent: 1, animated: true)
        emojiPickView.selectRow(Int(arc4random()) % 90 + 3, inComponent: 2, animated: true)
        
        if (dataArray1[emojiPickView.selectedRow(inComponent: 0)] == dataArray2[emojiPickView.selectedRow(inComponent: 1)] && dataArray2[emojiPickView.selectedRow(inComponent: 1)] == dataArray3[emojiPickView.selectedRow(inComponent: 2)]){
        resultLabel.text = "Bingo"
        
        } else {
        resultLabel.text = "So Bad"
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.1, options: .curveLinear, animations: { 
            self.goBtn.bounds = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.bounds.size.width + 20, height: self.bounds.size.height)
        }, completion: {(complete : Bool) in
            UIView.animateKeyframes(withDuration: 0.1, delay: 0.0, options: UIViewKeyframeAnimationOptions(), animations: { 
                self.goBtn.bounds = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.bounds.size.width, height: self.bounds.size.height)
            }, completion: nil)
        
        })
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var imageArray = [String]()
    var dataArray1 = [Int]()
    var dataArray2 = [Int]()
    var dataArray3 = [Int]()
    var bounds: CGRect = CGRect.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bounds = goBtn.bounds
        imageArray = ["👻","👸","💩","😘","🍔","🤖","🍟","🐼","🚖","🐷"]
        for _ in 0 ..< 100 {
            dataArray1.append((Int)(arc4random() % 10 ))
            dataArray2.append((Int)(arc4random() % 10 ))
            dataArray3.append((Int)(arc4random() % 10 ))
            
        }
    
        resultLabel.text = ""
        emojiPickView.delegate = self
        emojiPickView.dataSource = self
        goBtn.layer.cornerRadius = 6
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        goBtn.alpha = 0
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseOut, animations: { 
            self.goBtn.alpha = 1
        }, completion: nil)
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100
    }

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        if component == 0 {
        
            pickerLabel.text = imageArray[(Int)(dataArray1[row])]
        
        } else if component == 1 {
        
            pickerLabel.text = imageArray[(Int)(dataArray2[row])]
        
        } else if component == 2 {
        
            pickerLabel.text = imageArray[(Int)(dataArray3[row])]
        }
        pickerLabel.font = UIFont(name: "Apple Color Emoji", size: 80)
        pickerLabel.textAlignment = NSTextAlignment.center
        
        return pickerLabel
    }
    
}

