//
//  ViewController.swift
//  19-自定义下拉刷新
//
//  Created by Richy Li on 16/12/25.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tblDemo: UITableView!
    
    var dataArray: Array<String> = ["😂", "🤗", "😳", "😌", "😊"]
    var refreshController: UIRefreshControl!
    var customView: UIView!
    var labelArray: Array<UILabel> = []
    var isAnimating = false
    var currentColorIndex = 0
    var currentLabelIndex = 0
    var timer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        tblDemo.delegate = self
        tblDemo.dataSource = self
        refreshController = UIRefreshControl()
        refreshController.backgroundColor = UIColor.clear
        refreshController.tintColor = UIColor.clear
        tblDemo.addSubview(refreshController)
        
        loadRefreshContents()
    }
    func loadRefreshContents()  {
        let refreshContents = Bundle.main.loadNibNamed("RefreshContents", owner: self, options: nil)
        customView = refreshContents?[0] as! UIView
        customView.frame = refreshController.bounds
        
        for var i in 0 ..< customView.subviews.count {
        
            i = i + 1
            
            labelArray.append(customView.viewWithTag(i) as! UILabel)
        }
        refreshController.addSubview(customView)
    }
    func doSomething() {
    
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(ViewController.endedOfWork), userInfo: nil, repeats: true)
    
    }
    func endedOfWork(){
        refreshController.endRefreshing()
        timer.invalidate()
        timer = nil
    }
    func getNextColor() -> UIColor {
        var colorArray: Array<UIColor> = [UIColor.magenta, UIColor.brown, UIColor.yellow, UIColor.red,UIColor.green, UIColor.orange,UIColor.blue]
        if currentColorIndex == colorArray.count {
        
            currentColorIndex = 0
        }
        let returnColor = colorArray[currentColorIndex]
        currentColorIndex += 1
        return returnColor
    }
    
    func animateRefreshStep1() {
        
        isAnimating = true
        
        UIView.animate(withDuration: 0.1, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: { () -> Void in
            
            self.labelArray[self.currentLabelIndex].transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_4))
            self.labelArray[self.currentLabelIndex].textColor = self.getNextColor()
            
        }, completion: { (finished) -> Void in
            
            UIView.animate(withDuration: 0.05, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: { () -> Void in
                self.labelArray[self.currentLabelIndex].transform = CGAffineTransform.identity
                self.labelArray[self.currentLabelIndex].textColor = UIColor.black
                
            }, completion: { (finished) -> Void in
                self.currentLabelIndex += 1
                
                if self.currentLabelIndex < self.labelArray.count {
                    self.animateRefreshStep1()
                }
                else {
                    self.animateRefreshStep2()
                }
            })
        })
    }
    
    
    func animateRefreshStep2() {
        UIView.animate(withDuration: 0.40, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: { () -> Void in
            
            self.labelArray[0].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelArray[1].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelArray[2].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelArray[3].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelArray[4].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelArray[5].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelArray[6].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelArray[7].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelArray[8].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelArray[9].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelArray[10].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelArray[11].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            
        }, completion: { (finished) -> Void in
            
            UIView.animate(withDuration: 0.25, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: { () -> Void in
                self.labelArray[0].transform = CGAffineTransform.identity
                self.labelArray[1].transform = CGAffineTransform.identity
                self.labelArray[2].transform = CGAffineTransform.identity
                self.labelArray[3].transform = CGAffineTransform.identity
                self.labelArray[4].transform = CGAffineTransform.identity
                self.labelArray[5].transform = CGAffineTransform.identity
                self.labelArray[6].transform = CGAffineTransform.identity
                self.labelArray[7].transform = CGAffineTransform.identity
                self.labelArray[8].transform = CGAffineTransform.identity
                self.labelArray[9].transform = CGAffineTransform.identity
                self.labelArray[10].transform = CGAffineTransform.identity
                self.labelArray[11].transform = CGAffineTransform.identity
                
            }, completion: { ( finished) -> Void in
                if self.refreshController.isRefreshing {
                    self.currentLabelIndex = 0
                    self.animateRefreshStep1()
                }
                else {
                    self.isAnimating = false
                    self.currentLabelIndex = 0
                    for  i in 0 ..< self.labelArray.count {
                        
                        self.labelArray[i].textColor = UIColor.black
                        self.labelArray[i].transform = CGAffineTransform.identity
                    }
                }
            })
        })
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if refreshController.isRefreshing {
            if !isAnimating {
            doSomething()
                animateRefreshStep1()
            
            }
        }
    }
    
    
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell", for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Apple Color Emoji", size: 40)
        cell.textLabel?.textAlignment = NSTextAlignment.center
        return cell
    }
}

