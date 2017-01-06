//
//  ViewController.swift
//  22-面部识别
//
//  Created by Richy Li on 16/12/31.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var originImg: UIImageView!
    @IBOutlet weak var resultImg: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
      originImg.image = UIImage(named: "face")
    }

    @IBAction func didTouch(_ sender: UIButton) {
        let context = CIContext(options: nil)
        let originImage = self.originImg.image
        let image = CIImage(cgImage: (originImage?.cgImage)!)
        
        let param = [CIDetectorAccuracyHigh:CIDetectorAccuracy]
        let faceDetector = CIDetector(ofType: CIDetectorTypeFace, context: context, options: param)
        
        let detectResult = faceDetector?.features(in: image)
        let resultView = UIView(frame: self.originImg.frame)
        self.view.addSubview(resultView)
        
        for item in detectResult! {
            
            let faceFeature = item as! CIFaceFeature
            let faceView = UIView(frame: faceFeature.bounds)
            faceView.layer.borderWidth = 1
            faceView.layer.borderColor = UIColor.orange.cgColor
            resultView.addSubview(faceView)
            
            if faceFeature.hasLeftEyePosition {
            
                let leftEyeView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 5))
                leftEyeView.center = faceFeature.leftEyePosition
                leftEyeView.layer.borderColor = UIColor.red.cgColor
                leftEyeView.layer.borderWidth = 1
                resultView.addSubview(leftEyeView)
            
            }
            if faceFeature.hasRightEyePosition {
                
                let rightEyeView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 5))
                rightEyeView.center = faceFeature.rightEyePosition
                rightEyeView.layer.borderColor = UIColor.red.cgColor
                rightEyeView.layer.borderWidth = 1
                resultView.addSubview(rightEyeView)
                
            }
            if faceFeature.hasMouthPosition {
                
                let mouthView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 5))
                mouthView.center = faceFeature.mouthPosition
                mouthView.layer.borderColor = UIColor.red.cgColor
                mouthView.layer.borderWidth = 1
                resultView.addSubview(mouthView)
            }
        
        }
        
        resultView.transform = CGAffineTransform(scaleX: 1, y: -1)
        
        if (detectResult?.count)! > 0 {
        
            let faceImage = image.cropping(to: (detectResult?[0].bounds)!)
            let face = UIImage(cgImage: context.createCGImage(faceImage, from: faceImage.extent)!)
            
            self.resultImg.image = face
            let resultText = String(format: "识别人脸数 %i", (detectResult?.count)!)
            
            resultLabel.text = resultText
        }
    }
 

}

