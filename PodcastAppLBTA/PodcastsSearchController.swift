//
//  PodcastsSearchController.swift
//  PodcastAppLBTA
//
//  Created by Anand on 29/08/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit
import Alamofire

class PodcastsSearchController: UITableViewController, UISearchBarDelegate {
    
    lazy var podcasts = [Podcast]()
    let cellId = "cellId"
    
    //Lets implement a UISearchController ios 11
//    let searchController = UISearchController(searchResultsController: nil)
    
    //iOS 10
    lazy var searchBar = UISearchBar()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBar()
        setupTableView()
    }
    
    fileprivate func setupSearchBar() {
        self.definesPresentationContext = true
        //Uncomment Next Line in iOS 11
//        navigationItem.searchController = searchController
//        navigationItem.hidesSearchBarWhenScrolling = false
//        searchController.dimsBackgroundDuringPresentation = false
//        searchController.searchBar.delegate = self
        
        //iOS 10
        
        searchBar.searchBarStyle = UISearchBarStyle.prominent
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        navigationItem.titleView = searchBar


    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        print(1)
        
        APIService.shared.fetchPodcasts(searchText: searchText) { (podcasts) in
            self.podcasts = podcasts
            self.tableView.reloadData()
        }
       
        /*
        Alamofire.request(url).responseData { (dataResponse) in
            if let err = dataResponse.error {
                print("Faild to contact yahoo", err)
                return
            }
            let json = dataResponse.result.value
            
            guard let data = dataResponse.data else { return }
            let dummyString = String(data: data, encoding: .utf8)
            print(dummyString ?? "")
            
//            do {
//                let searchResult = try JSONDecoder().decode(SearchResults.self, from: data)
//                print("Result Count:", searchResult.resultCount)
//                
//            } catch let decodeErr {
//                print("Failed tgo decode:", decodeErr)
//            }
            
            
        } */
    }
    
    
    fileprivate func setupTableView() {
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
        let nib = UINib(nibName: "PodcastCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellId)
    }
    
    //MARK:- UITableView
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episodeController = EpisodeController()
        let podcast = self.podcasts[indexPath.row]
        episodeController.podcast = podcast
        navigationController?.pushViewController(episodeController, animated: true)
        print(indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Please enter a Search Term"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightSemibold)
        return label
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        //Ternary operator
        return self.podcasts.count > 0 ? 0 : 250
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PodcastCell
        
        let podcast = podcasts[indexPath.row]
        cell.podcast = podcast
        
//        let podcast = podcasts[indexPath.row]
//        cell.textLabel?.text = "\(podcast.name)\n\(podcast.artistName)"
//        cell.textLabel?.numberOfLines = -1
//        cell.imageView?.image = #imageLiteral(resourceName: "appicon")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 132
    }
}

