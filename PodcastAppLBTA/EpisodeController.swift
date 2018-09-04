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
        guard let url = URL(string: feedUrl) else { return }
        let parser = FeedParser(URL: url)
        parser?.parseAsync(result: { (result) in
            print("Successfully parse feed:", result.isSuccess)
            
            switch result {
                case let .rss(feed):
                
                var episodes = [Episode]() //Blank Episode Array
                
                feed.items?.forEach({ (feedItem) in
                    let episode = Episode(title: feedItem.title ?? "")
                    episodes.append(episode)
                })
                self.episodes = episodes
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
                
            case let .failure(error):
                print("Failed to parse feed:", error)
                break
                
            default:
                print("Found a feed....")
            }
            
        })
    }
    
    fileprivate let cellId = "cellId"
    
    struct Episode {
        let title: String
    }
    
    var episodes = [
        Episode(title: "First Episode"),
        Episode(title: "Second Episode"),
        Episode(title: "Third Episode")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    
    //MARK:- Setup work
    fileprivate func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()

    }
    
    //MARK:- TableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let episode = episodes[indexPath.row]
        cell.textLabel?.text = episode.title
        return cell
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
