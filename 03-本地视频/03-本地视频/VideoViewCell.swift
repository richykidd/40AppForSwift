//
//  VideoViewCell.swift
//  03-本地视频
//
//  Created by Richy Li on 16/12/18.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit

struct video {
    let image : String
    let title : String
    let source : String
}

class VideoViewCell: UITableViewCell {

    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoSource: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
