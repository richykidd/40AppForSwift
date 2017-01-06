//
//  FirstViewController.swift
//  27-Tabbar
//
//  Created by Richy Li on 16/12/28.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var article: UITableView!
    
    var data = [
    
       (avatarImage: "allen", sharedName: "Allen Wang", actionType: "Read Later", articleTitle: "Giphy Cam Lets You Create And Share Homemade Gifs", articleCoverImage: "giphy", articleSouce: "TheNextWeb", articleTime: "5min  •  13:20"),
      (avatarImage: "Daniel Hooper", sharedName: "Daniel Hooper", actionType: "Shared on Twitter", articleTitle: "Principle. The Sketch of Prototyping Tools", articleCoverImage: "my workflow flow", articleSouce: "SketchTalk", articleTime: "3min  •  12:57"),
       (avatarImage: "davidbeckham", sharedName: "David Beckham", actionType: "Shared on Facebook", articleTitle: "Ohlala, An Uber For Escorts, Launches Its ‘Paid Dating’ Service In NYC", articleCoverImage: "Ohlala", articleSouce: "TechCrunch", articleTime: "1min  •  12:59"),
      (avatarImage: "bruce", sharedName: "Bruce Fan", actionType: "Shared on Weibo", articleTitle: "Lonely Planet’s new mobile app helps you explore major cities like a pro", articleCoverImage: "Lonely Planet", articleSouce: "36Kr", articleTime: "5min  •  11:21"),
    ]
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        article.dataSource = self
        article.delegate = self
        article.separatorStyle = UITableViewCellSeparatorStyle.none
        article.tableFooterView = UIView(frame: CGRect.zero)
        

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 165
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = article.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ArticleTableViewCell
        let articledata = data[indexPath.row]
        cell.avatarImage.image = UIImage(named: articledata.avatarImage)
        cell.articleImage.image = UIImage(named: articledata.articleCoverImage)
        cell.nameLabel.text = articledata.sharedName
        cell.actionLabel.text = articledata.actionType
        cell.articleTitle.text = articledata.articleTitle
        cell.articleSource.text = articledata.articleSouce
        cell.articleCreat.text = articledata.articleTime
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func viewWillAppear(_ animated: Bool) {
        animata()
    }
    func animata(){
    
    self.article.reloadData()
        let cells = article.visibleCells
        let tableHeight: CGFloat = article.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            let cell: UITableViewCell = a as UITableViewCell
            UIView.animate(withDuration: 1.0, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
            
            index += 1
        }

    
    }
   
}
