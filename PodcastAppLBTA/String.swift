//
//  String.swift
//  PodcastAppLBTA
//
//  Created by Anand on 05/09/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import Foundation

extension String {
    func toSecureHTTPS() -> String {
        return self.contains("http") ? self : self.replacingOccurrences(of: "http", with: "https")
    }
}
