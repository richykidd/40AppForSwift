//
//  AnimationCellModel.swift
//  20-视图动画
//
//  Created by Richy Li on 16/12/25.
//  Copyright © 2016年 richyli. All rights reserved.
//

import Foundation

struct AnimationCellModel {
    let imagePath: String
    
    init(imagePath: String?) {
        self.imagePath = imagePath ?? ""
    }
}
