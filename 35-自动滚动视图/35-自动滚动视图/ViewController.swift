//
//  ViewController.swift
//  35-自动滚动视图
//
//  Created by Richy Li on 17/1/3.
//  Copyright © 2017年 richyli. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {

    @IBOutlet weak var bannerView: UICollectionView!
    
    
    var cvData = ["pic1", "pic2", "pic3", "pic4", "pic5"]
    
    var tvData = [
        Car(country: "Germany", brand: "Mercedes Benz"), Car(country: "Germany", brand: "BMW"),
        Car(country: "Germany", brand: "Audi"), Car(country: "Germany", brand: "Volkswagen"),
        Car(country: "American", brand: "Ford"), Car(country: "American", brand: "Chevrolet"),
        Car(country: "American", brand: "Hummer"), Car(country: "American", brand: "Lincoln"),
        Car(country: "England", brand: "Range Rover"), Car(country: "England", brand: "Bently"),
        Car(country: "England", brand: "Aston Martin"), Car(country: "England", brand: "Jaguar"),
        Car(country: "Italy", brand: "Lamborghini"), Car(country: "Italy", brand: "Ferrari"),
        Car(country: "Italy", brand: "Maserati"), Car(country: "Italy", brand: "Alfa Romeo")
        
    ]
    
    
    var timer: Timer!
    var index: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTimer()
    }
    
    // tableview
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tvData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! CarTableViewCell
        cell.countryLabel.text = tvData[indexPath.row].country
        cell.brandLabel.text = tvData[indexPath.row].brand
        
        return cell
    }
    
    // collectionview
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cvData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CarCollectionViewCell
        cell.carImageView.image = UIImage(named: cvData[indexPath.row])
        return cell
    }
    
    
    //  scrollView
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if scrollView.isKind(of: UICollectionView.self) {
        
            self.timer.invalidate()
            self.timer = nil
        
        }
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView.isKind(of: UICollectionView.self){
        
            self.index = Int(scrollView.contentOffset.x / UIScreen.main.bounds.size.width)
            self.startTimer()
        }
    }
    func automaticScroll(){
    
        self.index += 1
        if self.index > cvData.count - 1 {
        self.index = 0
            self.bannerView.scrollToItem(at: IndexPath.init(item: self.index, section: 0), at: .left, animated: false)
        
        } else {
        
            self.bannerView.scrollToItem(at: IndexPath.init(item: self.index, section: 0), at: .left, animated: true)
        }
    
    
    }
    func startTimer(){
    
        self.timer = Timer.init(timeInterval: 2, target: self, selector: #selector(ViewController.automaticScroll), userInfo: nil, repeats: true)
        RunLoop.current.add(self.timer, forMode: .commonModes)
    
    }
}

