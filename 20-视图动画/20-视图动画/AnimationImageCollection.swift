//
//  AnimationImageCollection.swift
//  20-视图动画
//
//  Created by Richy Li on 16/12/25.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit

struct AnimationImageCollection {
    fileprivate let imagePaths = ["1","2","3","4","5"]
    var images : [AnimationCellModel]
    
    init() {
        images = imagePaths.map {  AnimationCellModel(imagePath: $0)  }
    
    
    }
}
