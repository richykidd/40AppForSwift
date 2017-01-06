//
//  ViewController.swift
//  29-生成二维码
//
//  Created by Richy Li on 17/1/1.
//  Copyright © 2017年 richyli. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var qrcodeImageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var generateButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
      
       textField.delegate = self
        textField.returnKeyType = UIReturnKeyType.done
        generateButton.layer.cornerRadius = 5
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func createQRCodeFromSrting(_ qrString: String?, qrImageName: String?) -> UIImage? {
        if let QRSring = qrString {
        
            let QRSringData = QRSring.data(using: String.Encoding.utf8, allowLossyConversion: false)
            let QRFilter = CIFilter(name: "CIQRCodeGenerator")!
            QRFilter.setValue(QRSringData, forKey: "inputMessage")
            QRFilter.setValue("H", forKey: "inputCorrectionLevel")
            
            let QRCImage = QRFilter.outputImage
            let colorFilter = CIFilter(name: "CIFalseColor")!
            colorFilter.setDefaults()
            colorFilter.setValue(QRCImage, forKey: "inputImage")
            colorFilter.setValue(CIColor(red: 0, green: 0, blue: 0), forKey: "inputColor0")
            colorFilter.setValue(CIColor(red: 1, green: 1, blue: 1), forKey: "inputColor1")
            
            let transform = CGAffineTransform(scaleX: 5, y: 5)
            let transformImage = colorFilter.outputImage!.applying(transform)
            let codeImage = UIImage(ciImage: transformImage)
            
            if let iconImage = UIImage(named: qrImageName!){
            
                let rect = CGRect(x: 0, y: 0, width: codeImage.size.width, height: codeImage.size.height)
                UIGraphicsBeginImageContext(rect.size)
                codeImage.draw(in: rect)
                let avatarSize = CGSize(width: rect.size.width * 0.25, height: rect.size.height * 0.25)
                let x = (rect.width - avatarSize.width) * 0.5
                let y = (rect.height - avatarSize.height) * 0.5
                iconImage.draw(in: CGRect(x: x, y: y, width: avatarSize.width, height: avatarSize.height))
                let resultImage = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                return resultImage
            
            }
            
        return codeImage
        
        }
    
        return nil
    }

    @IBAction func generateButtonDidTouch(_ sender: UIButton) {
        qrcodeImageView.image = createQRCodeFromSrting(textField.text, qrImageName: "")
    }
  


}

