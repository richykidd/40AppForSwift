//
//  ViewController.swift
//  31-点击换头像
//
//  Created by Richy Li on 17/1/2.
//  Copyright © 2017年 richyli. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var headImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        headImage.layer.masksToBounds = true
        
        let gestureRecognizer = UITapGestureRecognizer()
        gestureRecognizer.addTarget(self, action: #selector(ViewController.changeHeadImage))
        headImage.addGestureRecognizer(gestureRecognizer)
        
    }
    override var prefersStatusBarHidden: Bool {
    
        return true
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerEditedImage] as! UIImage
        let rect = CGRect(x: 292, y: 268, width: 80, height: 80)
        headImage.frame = rect
        headImage.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func changeHeadImage() {
    
        let userIconAlert = UIAlertController(title: "请选择", message: "", preferredStyle: .actionSheet)
        let chooseFromPhotoalbum = UIAlertAction(title: "从相册选择", style: .default, handler: chooseFromPhotoAlbum)
        
        userIconAlert.addAction(chooseFromPhotoalbum)
        
        let chooseFromcamera = UIAlertAction(title: "拍照", style: .default, handler:chooseFromCamera)
        userIconAlert.addAction(chooseFromcamera)
        
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        userIconAlert.addAction(cancelAction)
        
        self.present(userIconAlert, animated: true, completion: nil)
        
    
    }

    func chooseFromPhotoAlbum(_ alertAction: UIAlertAction) -> Void {
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
        
            let picker = UIImagePickerController()
            
            picker.delegate = self
            picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            picker.allowsEditing = true
            self.present(picker, animated: true, completion: nil)
        
        } else {
        
            print("error")
        }
    
    
    }
    func chooseFromCamera(_ alertAction: UIAlertAction) -> Void {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
        
            let picker = UIImagePickerController()
            
            picker.delegate = self
            picker.sourceType = UIImagePickerControllerSourceType.camera
            picker.allowsEditing = true
            self.present(picker, animated: true, completion: nil)
            
        } else {
        
        print("error")
        }
        
    }
}

