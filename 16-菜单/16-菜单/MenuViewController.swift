//
//  MenuViewController.swift
//  16-菜单
//
//  Created by Richy Li on 16/12/23.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {

    var menuItems = ["Everyday Moments", "Popular", "Editors", "Upcoming", "Fresh", "Stock-photos", "Trending"]
    var currentItem = "Everyday Moments"
    override func viewDidLoad() {
        super.viewDidLoad()
  
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.view.backgroundColor = UIColor(red:0.109, green:0.114, blue:0.128, alpha:1)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return menuItems.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MenuTableViewCell
        
        cell.menuLabel.text = menuItems[indexPath.row]
        cell.menuLabel.textColor = (menuItems[indexPath.row] == currentItem) ? UIColor.white : UIColor.gray
        cell.backgroundColor = UIColor.clear
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let menuTableView = segue.source as! MenuViewController
        
        
        if let selectedRow = menuTableView.tableView.indexPathForSelectedRow?.row {
        
            currentItem = menuItems[selectedRow]
        }
    }

    
}
