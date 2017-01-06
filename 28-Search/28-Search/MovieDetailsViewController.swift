//
//  MovieDetailsViewController.swift
//  28-Search
//
//  Created by Richy Li on 16/12/29.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    @IBOutlet weak var imgMovieImage: UIImageView!

    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblCategory: UILabel!

    @IBOutlet weak var lblRating: UILabel!
    
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblDirector: UILabel!
    @IBOutlet weak var lblStars: UILabel!
    
    var movieInfo: [String: String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblRating.layer.cornerRadius = lblRating.frame.size.width / 2
        lblRating.layer.masksToBounds = true
        
        if movieInfo != nil {
        
        populateMovieInfo()
        }
       
    }
   
    func populateMovieInfo(){
    
        
        lblTitle.text = movieInfo["Title"]!
        lblCategory.text = movieInfo["Category"]!
        lblDescription.text = movieInfo["Description"]!
        lblDirector.text = movieInfo["Director"]!
        lblStars.text = movieInfo["Stars"]!
        lblRating.text = movieInfo["Rating"]!
        imgMovieImage.image = UIImage(named: movieInfo["Image"]!)

    
    
    }
}
