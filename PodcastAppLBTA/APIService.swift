//
//  APIService.swift
//  PodcastAppLBTA
//
//  Created by Anand on 01/09/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import Foundation
import Alamofire

class APIService {
    
    
    //Install These three Pods 1.Alamofire 2.Feedkit 3.SDWebImage
    
    //Singleton
    static let shared = APIService()
    
    func fetchPodcasts(searchText: String, completionHandler: @escaping ([Podcast]) -> ()) {
        
        print("Searching for podcasts...")
        
        //Removing White/Blank Space
        let keyword = searchText.components(separatedBy: .whitespaces).joined()
        
        //lets implement Alamofire to search iTunes API
        let url = "https://itunes.apple.com/search?term=\(keyword)"
        
        Alamofire.request(url, method: .get).responseJSON { response in
            guard response.error == nil else{
                print(response.error?.localizedDescription ?? "Error")
                return
            }
            
            DispatchQueue.main.async {
                guard let json = response.result.value as? [String: Any] else { return }
                print(3)
                let searchResults = SearchResults(dic: json)
                print(searchResults.podcast)
                completionHandler(searchResults.podcast)
                
                //                self.podcasts = searchResults.podcast
                //                self.tableView.reloadData()
            }
        }
        
        print(2)
        
    }
    
    struct SearchResults {
        let resultCount: Int
        let podcast: [Podcast]
        
        init(dic: [String:Any]) {
            self.resultCount = dic["resultCount"] as? Int ?? 0
            let podcastArray = dic["results"] as? [[String: Any]] ?? []
            self.podcast = podcastArray.flatMap(Podcast.init)
        }
    }
    
}











