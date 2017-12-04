//
//  Comment.swift
//  Timeline
//
//  Created by Kudryatzhan Arziyev on 12/4/17.
//  Copyright © 2017 Kudryatzhan Arziyev. All rights reserved.
//

import Foundation

class Comment {
    let text: String
    let timestamp: Date
    let post: Post
    
    init(post: Post, text: String, timestamp: Date = Date()) {
        self.post = post
        self.text = text
        self.timestamp = timestamp
    }
}
