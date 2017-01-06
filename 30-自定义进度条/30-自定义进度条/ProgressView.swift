//
//  ProgressView.swift
//  30-自定义进度条
//
//  Created by Richy Li on 17/1/1.
//  Copyright © 2017年 richyli. All rights reserved.
//

import UIKit

class ProgressView: UIView {

    struct Constant {
        
        // 进度条宽度
        static let lineWidth: CGFloat = 20
        
        // 轨道颜色
        static let trackColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        
        // 进度条颜色
        static let progressColor = UIColor(red: 0.4, green: 0.8, blue: 0.9, alpha: 1)
        
    }

    
    // 进度槽
    let trackLayer = CAShapeLayer()
    
    // 进度条
    let progressLayer = CAShapeLayer()
    
    // 路径
    let path = UIBezierPath()
    
    
    
    var progress: Int = 0 {
        didSet{
            if progress > 100 {
            
                progress = 100
            } else if progress < 0 {
                
                progress = 0
            
            
            }
        
        }
    
    }
    override func draw(_ rect: CGRect) {
        path.addArc(withCenter: CGPoint(x: bounds.minX + 150, y: bounds.midY),
                    radius: bounds.size.width / 2 - Constant.lineWidth,
                    startAngle: CGFloat(-90 / Double(180.0) * M_PI), endAngle: CGFloat(270 / Double(180.0) * M_PI), clockwise: true)
        
        //MARK: 绘制进度槽
        trackLayer.frame = bounds
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = Constant.trackColor.cgColor
        trackLayer.lineWidth = Constant.lineWidth
        trackLayer.path = path.cgPath
        layer.addSublayer(trackLayer)
        
        //MARK: 绘制进度条
        progressLayer.frame = bounds
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = Constant.progressColor.cgColor
        progressLayer.lineWidth = Constant.lineWidth
        progressLayer.path = path.cgPath
        progressLayer.strokeStart = 0
        progressLayer.strokeEnd = CGFloat(progress) / 100.0
        layer.addSublayer(progressLayer)
        
    }
    func setProgress(_ pro: Int, animate: Bool, duration: Double) -> Void {
        progress = pro
        CATransaction.begin()
        CATransaction.setDisableActions(animate)
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut))
        CATransaction.setAnimationDuration(duration)
        progressLayer.strokeEnd = CGFloat(progress) / 100
        CATransaction.commit()
        
    }
    
}
