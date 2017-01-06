//
//  ViewController.swift
//  32-图片保存到相册
//
//  Created by Richy Li on 17/1/2.
//  Copyright © 2017年 richyli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var photoImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
      saveButton.layer.cornerRadius = 10
    }

    @IBAction func savePhoto(_ sender: UIButton) {
        
        let image = photoImage.image
        CustomUlbum.sharedInstance.saveImage(image!, ulbumName: "jh")
        
        let alertController = UIAlertController(title: "saved", message:"" , preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
        
        
    }
   

}

