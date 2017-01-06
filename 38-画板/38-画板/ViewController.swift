//
//  ViewController.swift
//  38-画板
//
//  Created by Richy Li on 17/1/4.
//  Copyright © 2017年 richyli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var board: DrawingBoard!

    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var saveImageButton: UIButton!

    
    
    
    @IBAction func changeStrokeColor(_ sender: UIButton) {
        board.pathColor = sender.backgroundColor!
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        board.boardBackgroundColor = UIColor.white
        saveImageButton.layer.cornerRadius = 5
        clearButton.layer.cornerRadius = 5
          }
    @IBAction func saveImage(_ sender: UIButton) {
        let image = self.board.getImage()
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        let alertController = UIAlertController(title: "保存成功", message: "", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        self.board.cleanBoard()
    }

    @IBAction func clearDrawBoard(_ sender: UIButton) {
        self.board.cleanBoard()
    }
    


}

