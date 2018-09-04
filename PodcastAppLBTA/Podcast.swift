//
//  Podcast.swift
//  PodcastAppLBTA
//
//  Created by Anand on 29/08/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import Foundation

struct Podcast {
    var name: String?
    var artistName: String?
    var artworkUrl600: String?
    var trackCount: Int?
    var feedUrl: String?
    
    init(_ json: [String: Any]) {
        self.name = json["trackName"] as? String ?? ""
        self.artistName = json["artistName"] as? String ?? ""
        self.artworkUrl600 = json["artworkUrl600"] as? String ?? ""
        self.trackCount = json["trackCount"] as? Int ?? -1
        self.feedUrl = json["feedUrl"] as? String ?? ""
    }
}
