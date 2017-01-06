//
//  ViewController.swift
//  37-拉伸视图
//
//  Created by Richy Li on 17/1/4.
//  Copyright © 2017年 richyli. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    fileprivate let tableHeaderHeight: CGFloat = 250
    var headerView: UIView!
    let data = [
        Scenery(image: "pic1", name: "City", summary: "A large and densely populated urban area", nameColor: UIColor.red),
        Scenery(image: "pic2", name: "Mountain", summary: "A land mass that projects well above its surroundings", nameColor: UIColor.brown),
        Scenery(image: "pic3", name: "Field", summary: "A piece of land cleared of grass and usually enclosed", nameColor: UIColor.green),
        Scenery(image: "pic4", name: "Tree", summary: "A figure that branches from a single root", nameColor: UIColor.purple),
        Scenery(image: "pic5", name: "Snow", summary: "Precipitation falling from clouds in the form of ice crystals", nameColor: UIColor.blue),
        Scenery(image: "pic6", name: "Harbor", summary: "A sheltered port where ships can take on", nameColor: UIColor.orange)
    ]

    override func viewDidLoad() {
        
        super.viewDidLoad()
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        tableView.contentInset = UIEdgeInsets(top: tableHeaderHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -tableHeaderHeight)
        
            }

    func updateHeaderView(){
    
        var rect = CGRect(x: 0, y: -tableHeaderHeight, width: tableView.bounds.width, height: tableHeaderHeight)
        if tableView.contentOffset.y < -tableHeaderHeight {
        
            rect.origin.y = tableView.contentOffset.y
            rect.size.height = -tableView.contentOffset.y
        
        }
    
        headerView.frame = rect
    }
    override var prefersStatusBarHidden: Bool {
    
        return true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SceneryCell
        cell.sceneImage.image = UIImage(named: data[indexPath.row].image)
        cell.nameLabel.text = data[indexPath.row].name
        cell.nameLabel.textColor = data[indexPath.row].nameColor
        cell.summaryLabel.text = data[indexPath.row].summary
        return cell
    }
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
}

