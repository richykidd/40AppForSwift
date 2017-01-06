//
//  DrawerTableViewController.swift
//  40-侧边栏弹簧效果
//
//  Created by Richy Li on 17/1/5.
//  Copyright © 2017年 richyli. All rights reserved.
//

import UIKit

class DrawerTableViewController: UITableViewController {

    let data = [
        Player(name: "Tracy McGrady", pic: "1"),
        Player(name: "Kobe Bryant", pic: "2"),
        Player(name: "Michael Jordan", pic: "3"),
        Player(name: "LeBron James", pic: "4"),
        Player(name: "Dwight Howard", pic: "5"),
        Player(name: "Jeremy Lin", pic: "6"),
        Player(name: "Kevin Durant", pic: "7"),
        Player(name: "Stephen Curry", pic: "8")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

      override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DrawerCell
        cell.imageView?.image = UIImage(named: data[indexPath.row].pic)
        cell.nameLabel.text = data[indexPath.row].name

        // Configure the cell...

        return cell
    }
   
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }

  

}
