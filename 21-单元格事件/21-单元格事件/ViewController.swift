//
//  ViewController.swift
//  21-单元格事件
//
//  Created by Richy Li on 16/12/26.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    var data = [
        pattern(image: "1", name: "Pattern Building"),
        pattern(image: "2", name: "Joe Beez"),
        pattern(image: "3", name: "Car It's car"),
        pattern(image: "4", name: "Floral Kaleidoscopic"),
        pattern(image: "5", name: "Sprinkle Pattern"),
        pattern(image: "6", name: "Palitos de queso"),
        pattern(image: "7", name: "Ready to Go? Pattern"),
        pattern(image: "8", name: "Sets Seamless"),
        ]

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PatternCell", for: indexPath) as! TableViewCell
        let pattern = data[indexPath.row]
        cell.patternImageView.image = UIImage(named: pattern.image)
        cell.patternLabel.text = pattern.name
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .normal, title: "🗑\nDelete") { (action, index) in
            print("Delete")
        }
        delete.backgroundColor = UIColor.gray
        let share = UITableViewRowAction(style: .normal, title: "🤗\nShare") { (action: UITableViewRowAction!,index) in
            let firstActivityItem = self.data[indexPath.row]
            let activityViewController = UIActivityViewController(activityItems: [firstActivityItem.image as NSString], applicationActivities: nil)
            self.present(activityViewController, animated: true, completion: nil)
        }
        share.backgroundColor = UIColor.blue
        let download = UITableViewRowAction(style: .normal, title: "⬇️\nDownload") { (
            action, index) in
            print("Download")
        }
        download.backgroundColor = UIColor.red
        
        return [download, share, delete]
    }
}

