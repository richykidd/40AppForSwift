//
//  ViewController.swift
//  07-下拉刷新
//
//  Created by Richy Li on 16/12/20.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let cellID = "cellID"
    let emoji = ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"]
    let newEmoji = ["🏃🏃🏃🏃🏃", "💩💩💩💩💩", "👸👸👸👸👸"]
    var emojiData = [String]()
    var tableViewController = UITableViewController(style: .plain)
    var refreshControl = UIRefreshControl()
    var navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 60))
    
    
    
    override func viewDidLoad() {
        
                super.viewDidLoad()
       
     

        emojiData = emoji
        let emojiTableView = tableViewController.tableView
        emojiTableView?.dataSource = self
        emojiTableView?.backgroundColor = UIColor(red: 0.092, green: 0.096, blue: 0.116, alpha: 1)
        emojiTableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
       emojiTableView?.frame = CGRect(x: 0, y: 60, width: Int(UIScreen.main.bounds.width), height: Int(UIScreen.main.bounds.height - 60))
       
        tableViewController.refreshControl = self.refreshControl
        self.refreshControl.addTarget(self, action: #selector(ViewController.didRoadEmoji), for: .valueChanged)
        
        self.refreshControl.backgroundColor = UIColor(red: 0.113, green: 0.113, blue: 0.145, alpha: 1)
        self.refreshControl.tintColor = UIColor.white
        
        
        self.navBar.barStyle = UIBarStyle.blackTranslucent
        
        emojiTableView?.rowHeight = UITableViewAutomaticDimension
        emojiTableView?.estimatedRowHeight = 70
        emojiTableView?.tableFooterView = UIView(frame: .zero)
        emojiTableView?.separatorStyle = UITableViewCellSeparatorStyle.none
        
        self.view.addSubview(emojiTableView!)
        self.view.addSubview(navBar)
       
       
        
           }


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID)! as UITableViewCell
        
        cell.textLabel?.text = self.emojiData[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 50)
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.textLabel!.textAlignment = NSTextAlignment.center
        
        
        
        return cell
    }
    
    func didRoadEmoji() {
        
        sleep(1)
        self.emojiData = newEmoji
        self.tableViewController.tableView.reloadData()
        
       
        self.refreshControl.endRefreshing()
    
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
    return UIStatusBarStyle.lightContent
    }
}

