//
//  DrawingBoard.swift
//  38-画板
//
//  Created by Richy Li on 17/1/4.
//  Copyright © 2017年 richyli. All rights reserved.
//

import UIKit

class DrawingBoard: UIView {
    var lineWidth: CGFloat = 2
    var pathColor: UIColor = UIColor.black
    var boardBackgroundColor: UIColor!
    
    var lines = [Line]()
    var touchPoint: CGPoint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
        
            touchPoint = touch.location(in: self)
        
        }
        super.touchesBegan(touches, with: event)
        self.setNeedsDisplay()
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let firstTouch = touches.first{
        
            let endPoint = firstTouch.location(in: self)
            lines.append(Line(start: touchPoint, end: endPoint))
            touchPoint = endPoint
        
        }
        super.touchesBegan(touches, with: event)
        self.setNeedsDisplay()
    }
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.beginPath()
        
        for line in lines{
        
            context?.move(to: CGPoint(x: line.startPoint.x, y: line.startPoint.y))
            context?.addLine(to: CGPoint(x: line.endPoint.x, y: line.endPoint.y))
        
        }
        context?.setStrokeColor(pathColor.cgColor)
        context?.setLineWidth(lineWidth)
        context?.strokePath()
        
    }
    
    func getImage() -> UIImage {
    
        UIGraphicsBeginImageContext(CGSize(width: self.bounds.size.width, height: self.bounds.size.height))
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
        
    }
    func cleanBoard(){
    
        self.lines = []
        self.setNeedsDisplay()
    
    }
}
