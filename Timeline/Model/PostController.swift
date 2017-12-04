//
//  PostController.swift
//  Timeline
//
//  Created by Kudryatzhan Arziyev on 12/4/17.
//  Copyright © 2017 Kudryatzhan Arziyev. All rights reserved.
//

import UIKit

class PostController {
    
    static let shared = PostController()
    
    var posts = [Post]()
    
    // MARK: - Actions
    func createPostWith(image: UIImage, caption: String) {
        guard let data = UIImageJPEGRepresentation(image, 0.8) else { return }
        
        let post = Post(photoData: data)
        posts.append(post)
        
        let captionComment = Comment(post: post, text: caption)
    }
    
    func addComment(toPost post: Post, textComment: String) {
        let comment = Comment(post: post, text: textComment)
        post.comments.append(comment)
    }
}
