//
//  PodcastCell.swift
//  PodcastAppLBTA
//
//  Created by Anand on 02/09/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit
import SDWebImage

class PodcastCell: UITableViewCell {
    
    
    @IBOutlet weak var podcastImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var episodeCountLabel: UILabel!
    
    var podcast: Podcast! {
        didSet{
            trackNameLabel.text = podcast.name
            artistNameLabel.text = podcast.artistName
            
            episodeCountLabel.text = "\(podcast.trackCount ?? 0) Episodes"
            
//          print("Loading image with url:", podcast.artworkUrl600 ?? "")
            
            guard let url = URL(string: podcast.artworkUrl600 ?? "") else { return }
            
            //Catching/Downloading Images Without Pod
//            URLSession.shared.dataTask(with: url) { (data, _, _) in
//                print("Finish downloading image data", data)
//                
//                guard let data = data else { return }
//                
//                DispatchQueue.main.async {
//                    self.podcastImageView.image = UIImage(data: data)
//                }
//                
//            }.resume()
            
            podcastImageView.sd_setImage(with: url, completed: nil)
        }
    }
}
