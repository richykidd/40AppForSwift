//
//  ViewController.swift
//  28-Search
//
//  Created by Richy Li on 16/12/29.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit
import CoreSpotlight
import MobileCoreServices

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tblMovies: UITableView!
    
    var moviesInfo : NSMutableArray!
    var selectedMovieIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        configureTableView()
        loadMoviesInfo()
    }
    func loadMoviesInfo(){
    
        if let path = Bundle.main.path(forResource: "MoviesData", ofType: "plist") {
        
            moviesInfo = NSMutableArray(contentsOfFile: path)
        }
    
    }
    func configureTableView(){
    
        tblMovies.delegate = self
        tblMovies.dataSource = self
        tblMovies.tableFooterView = UIView(frame: .zero)
        tblMovies.register(UINib(nibName:"MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "idCellMovieSummary")
       
    
    }
    func setupSearchableContent(){
    
        var searchableItems = [CSSearchableItem]()
        
        for i in 0...(moviesInfo.count - 1){
            let movie = moviesInfo[i] as! [String: String]
            let searchableItemAttributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
            
            searchableItemAttributeSet.title = movie["Title"]!
            let imagePathParts = movie["Image"]!.components(separatedBy: ".")
            searchableItemAttributeSet.thumbnailURL = Bundle.main.url(forResource: imagePathParts[0], withExtension: imagePathParts[1])
            searchableItemAttributeSet.contentDescription = movie["Description"]!
            var keywords = [String]()
            let movieCategories = movie["Catagory"]!.components(separatedBy: ", ")
            for movieCategory in movieCategories {
            
                keywords.append(movieCategory)
            }
            let stars = movie["Stars"]!.components(separatedBy: ", ")
            for star in stars {
            
                keywords.append(star)
            }
            searchableItemAttributeSet.keywords = keywords
            let searchbleItem = CSSearchableItem(uniqueIdentifier: "com.appcoda.SpotIt.\(i)", domainIdentifier: "movies", attributeSet: searchableItemAttributeSet)
            searchableItems.append(searchbleItem)
            
            CSSearchableIndex.default().indexSearchableItems(searchableItems, completionHandler: { (error) in
                if error != nil {
                
                    print(error?.localizedDescription as Any)
                
                }
            })
        }
    
    }

    override func restoreUserActivityState(_ activity: NSUserActivity) {
        if activity.activityType == CSSearchableItemActionType {
        
            if let userInfo = activity.userInfo {
            
                let selectedMovie = userInfo[CSSearchableItemActivityIdentifier] as! String
                selectedMovieIndex = Int(selectedMovie.components(separatedBy: ".").last!)
                performSegue(withIdentifier: "idSegueShowMovieDetails", sender: self)
            
            }
        
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if moviesInfo != nil {
        
            return moviesInfo.count
        }
        return 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCellMovieSummary", for: indexPath) as! MovieTableViewCell
        let currentMovieInfo = moviesInfo[indexPath.row] as! [String: String]
        cell.lblTitle.text = currentMovieInfo["Title"]!
        cell.lblDescription.text = currentMovieInfo["Description"]!
        cell.lblRating.text = currentMovieInfo["Rating"]!
        cell.imgMovieImage.image = UIImage(named: currentMovieInfo["Image"]!)
        
        return cell
    }
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMovieIndex = indexPath.row
      
        performSegue(withIdentifier: "idSegueShowMovieDetails", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
        
            if identifier == "idSegueShowMovieDetails" {
            
                let movieDetailsViewController = segue.destination as! MovieDetailsViewController
                movieDetailsViewController.movieInfo = moviesInfo[selectedMovieIndex] as![String: String]
                
            }
        }
    }
}

