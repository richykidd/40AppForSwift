//
//  ViewController.swift
//  10-VideoBackground
//
//  Created by Richy Li on 16/12/21.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    var player: AVPlayer!
    var playerItem: AVPlayerItem!
    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var loginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
  
        playVideo()
    }
    @IBAction func touchUP(_ sender: UIButton) {
        
        let otherView = OtherViewController()
        
        self.present(otherView, animated: true, completion: nil)
    }

    func playVideo(){
    
        let path = Bundle.main.path(forResource: "moments", ofType: "mp4")
        let url = URL(fileURLWithPath: path!)
        
        playerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem)
        
        let playerLayer = AVPlayerLayer(player: player)
        
        playerLayer.frame = backView.bounds
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        backView.layer.insertSublayer(playerLayer, at: 0)
        backView.alpha = 0.8
    
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.didFinishVideo(sender:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerItem)
        
        playerLayer.player?.play()
    }

    func didFinishVideo(sender: NSNotification ){
        let item = sender.object as! AVPlayerItem
        item.seek(to: kCMTimeZero)
        self.player.play()
    
    
    }

}

