//
//  FourthViewController.swift
//  25-五种动画效果
//
//  Created by Richy Li on 16/12/27.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    @IBOutlet weak var backgView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseIn, animations: { 
            self.backgView.backgroundColor = UIColor.black
        }, completion: nil)
        UIView.animate(withDuration: 0.5, delay: 0.8, options: .curveEaseOut, animations: { 
            self.nameLabel.textColor = UIColor.white
        }, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
