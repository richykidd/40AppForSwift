//
//  Line.swift
//  38-画板
//
//  Created by Richy Li on 17/1/4.
//  Copyright © 2017年 richyli. All rights reserved.
//

import UIKit

class Line {
    var startPoint: CGPoint
    var endPoint: CGPoint
    
    init(start: CGPoint, end: CGPoint) {
        self.startPoint = start
        self.endPoint = end
    }
}
