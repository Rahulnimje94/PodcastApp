//
//  EpisodeController.swift
//  PodcastAppLBTA
//
//  Created by Anand on 03/09/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit
import FeedKit

class EpisodeController: UITableViewController {
    
    var podcast: Podcast? {
        didSet{
            navigationItem.title = podcast?.name
            
            fetchEpisode()
        }
    }
    
    fileprivate func fetchEpisode() {
        print("Looking for episodes at feed url:", podcast?.feedUrl ?? "")
        
        guard let feedUrl = podcast?.feedUrl else { return }
      
        APIService.shared.fetchEpisodes(feedUrl: feedUrl) { (episodes) in
            self.episodes = episodes
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    fileprivate let cellId = "cellId"
    
        
    var episodes = [Episode]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    
    //MARK:- Setup work
    fileprivate func setupTableView() {
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        let nib = UINib(nibName: "EpisodeCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()

    }
    
    //MARK:- TableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! EpisodeCell
        let episode = episodes[indexPath.row]
        
        cell.episode = episode
        
        
//        cell.textLabel?.numberOfLines = 0
//        cell.textLabel?.text = episode.title + "\n" + episode.pubDate.description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 134
    }
    
    
    
    
    
    
    
    
    
    
}
