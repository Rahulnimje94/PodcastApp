//
//  RSSFeed.swift
//  PodcastAppLBTA
//
//  Created by Anand on 05/09/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import FeedKit

extension RSSFeed {
    
    func toEpisodes() -> [Episode] {
        let imageUrl = iTunes?.iTunesImage?.attributes?.href
        
        var episodes = [Episode]() //Blank Episode Array
        items?.forEach({ (feedItem) in
            var episode = Episode(feedItem: feedItem)
            
            if episode.imageUrl == nil {
                episode.imageUrl = imageUrl
            } else {
                episode.imageUrl = imageUrl
            }
            
            episodes.append(episode)
        })
        return episodes
        
    }
}
