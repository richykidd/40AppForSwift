//
//  ViewController.swift
//  05-滚动视图
//
//  Created by Richy Li on 16/12/19.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate var interests = Interest.createIneresrs()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }

   override var preferredStatusBarStyle: UIStatusBarStyle {
    
    return UIStatusBarStyle.lightContent
    }
    fileprivate struct Storyboard {
    
        static let CellIdentifier = "InterestCell"
    }
   

}
extension ViewController : UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.CellIdentifier, for: indexPath) as! InterestCollectionViewCell
        cell.interest = self.interests[indexPath.item]
        return cell
    }
}
