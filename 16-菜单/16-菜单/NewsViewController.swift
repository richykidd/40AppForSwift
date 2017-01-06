//
//  NewsViewController.swift
//  16-菜单
//
//  Created by Richy Li on 16/12/23.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit

class NewsViewController: UITableViewController, MenuTransitionManagerDelegate {
    
    let menuManager = MenuTransitionManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Everyday"
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.view.backgroundColor = UIColor(red: 0.062, green: 0.062, blue: 0.07, alpha: 1)
    }
    func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }

  
    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
        cell.backgroundColor = UIColor.clear
        
        if indexPath.row == 0 {
            cell.postImageView.image = UIImage(named: "1")
            cell.postTitle.text = "Love mountain."
            cell.postAuthor.text = "Allen Wang"
            cell.authorImageView.image = UIImage(named: "a")
            
        } else if indexPath.row == 1 {
            cell.postImageView.image = UIImage(named: "2")
            cell.postTitle.text = "New graphic design - LIVE FREE"
            cell.postAuthor.text = "Cole"
            cell.authorImageView.image = UIImage(named: "b")
            
        } else if indexPath.row == 2 {
            cell.postImageView.image = UIImage(named: "3")
            cell.postTitle.text = "Summer sand"
            cell.postAuthor.text = "Daniel Hooper"
            cell.authorImageView.image = UIImage(named: "c")
            
        } else {
            cell.postImageView.image = UIImage(named: "4")
            cell.postTitle.text = "Seeking for signal"
            cell.postAuthor.text = "Noby-Wan Kenobi"
            cell.authorImageView.image = UIImage(named: "d")
            
        }


        

        return cell
    }
    

    @IBAction func unwindToHome(_ segue: UIStoryboardSegue) {
        
        let sourceController = segue.source as! MenuViewController
        self.title = sourceController.currentItem
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let menuTableViewController = segue.destination as! MenuViewController
        menuTableViewController.currentItem = self.title!
        menuTableViewController.transitioningDelegate = menuManager
        menuManager.delegate = self
    }
   }
