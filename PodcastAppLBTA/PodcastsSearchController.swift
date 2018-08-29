//
//  PodcastsSearchController.swift
//  PodcastAppLBTA
//
//  Created by Anand on 29/08/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit

class PodcastsSearchController: UITableViewController, UISearchBarDelegate {
    
    let podcasts = [
        Podcast(name: "Lets Build That App", artistName: "Brian Voong"),
        Podcast(name: "Some Podast", artistName: "Some Auther")
    ]
    
    let cellId = "cellId"
    
    //Lets implement a UISearchController
    let searchController = UISearchController(searchResultsController: nil)
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBar()
        setupTableView()
    }
    
    fileprivate func setupSearchBar() {
        //Uncomment Next Line in iOS 11
        //navigationItem.searchController = searchController
        //navigationItem.hidesSearchBarWhenScrolling = false
        //searchController.dimsBackgroundDuringPresentation = false
        //searchController.searchBar.delegate = self

    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        //lets implement Alamofire to search iTunes API
    }
    
    fileprivate func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    //MARK:- UITableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        let podcast = podcasts[indexPath.row]
        cell.textLabel?.text = "\(podcast.name)\n\(podcast.artistName)"
        cell.textLabel?.numberOfLines = -1
        cell.imageView?.image = #imageLiteral(resourceName: "appicon")
        
        return cell
    }
}
