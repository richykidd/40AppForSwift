//
//  AnimatedLabel.swift
//  33-字体渐变
//
//  Created by Richy Li on 17/1/2.
//  Copyright © 2017年 richyli. All rights reserved.
//

import UIKit
@IBDesignable
class AnimatedLabel: UIView {
    struct Constants {
        struct Fonts {
            static let animatedLabel = "HelveticaNeue-UltraLight"
        }
    }
    let gradientLayer: CAGradientLayer = {
    
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        
        let colors = [UIColor.gray.cgColor, UIColor.white.cgColor, UIColor.gray.cgColor, UIColor.white.cgColor,UIColor.gray.cgColor]
        gradientLayer.colors = colors
        
        let locations = [0.00, 0.25, 0.5, 0.75, 1]
        gradientLayer.locations = locations as [NSNumber]?
    
     return gradientLayer
    }()
    let textAttributes: [String: AnyObject] = {
    
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        return [NSFontAttributeName:UIFont(name: Constants.Fonts.animatedLabel,size: 50)!, NSParagraphStyleAttributeName:style]
    
    }()
    @IBInspectable var text:String! {
        
        
        didSet {
            setNeedsDisplay()
            
            UIGraphicsBeginImageContextWithOptions(frame.size, false, 0)
            text.draw(in: bounds,withAttributes: textAttributes)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            let maskLayer = CALayer()
            maskLayer.backgroundColor = UIColor.clear.cgColor
            maskLayer.frame = bounds.offsetBy(dx: bounds.size.width, dy: 0)
            maskLayer.contents = image?.cgImage
            
            gradientLayer.mask = maskLayer
        
        
        }
    
    }
    override func layoutSubviews() {
        gradientLayer.frame = CGRect(x: -bounds.size.width, y: bounds.origin.y, width: bounds.size.width * 2, height: bounds.size.height)
    }
    override func didMoveToWindow() {
        super.didMoveToWindow()
        
        layer.addSublayer(gradientLayer)
        
        let gradientAnimation = CABasicAnimation(keyPath: "locations")
        gradientAnimation.fromValue = [0,0,0.25,0.25,0.25]
        gradientAnimation.toValue = [0.75,1,1,1,1]
        gradientAnimation.duration = 1.9
        gradientAnimation.repeatCount = 100
        gradientAnimation.isRemovedOnCompletion = false
        gradientAnimation.fillMode = kCAFillModeForwards
        
        gradientLayer.add(gradientAnimation, forKey: nil)
    }

}
