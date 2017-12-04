//
//  PostDetailTableViewController.swift
//  Timeline
//
//  Created by Kudryatzhan Arziyev on 12/4/17.
//  Copyright © 2017 Kudryatzhan Arziyev. All rights reserved.
//

import UIKit

class PostDetailTableViewController: UITableViewController {
    
    @IBOutlet weak var postImageView: UIImageView!
    
    var post: Post? {
        didSet {
            updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return post?.comments.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostDetailTableViewCell", for: indexPath)
        
        guard let post = post else { return cell }
        cell.detailTextLabel?.text = post.comments[indexPath.row].text
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            post?.comments.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - IBActions
    @IBAction func commentButtonPressed(_ sender: UIButton) {
        presentCommentAlert()
    }
    
    func presentCommentAlert() {
        let alertController = UIAlertController(title: "Add Comment", message: nil, preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Add comment here..."
        }
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            guard let commentText = alertController.textFields?.first?.text,
                !commentText.isEmpty,
                let post = self.post else { return }
            
            PostController.shared.addComment(toPost: post, textComment: commentText)
        }
        alertController.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alertController.addAction(cancelAction)
        
        
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func shareButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func followPostButtonPressed(_ sender: UIButton) {
        
    }
    
    func updateViews() {
        postImageView.image = post?.image
        tableView.reloadData()
    }
}
