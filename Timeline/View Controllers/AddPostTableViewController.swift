//
//  AddPostTableViewController.swift
//  Timeline
//
//  Created by Kudryatzhan Arziyev on 12/4/17.
//  Copyright © 2017 Kudryatzhan Arziyev. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var captionTextField: UITextField!
    @IBOutlet weak var imageButton: UIButton!
    
    @IBAction func selectImageButtonTapped(_ sender: UIButton) {
        imageView.image = UIImage(named: "cardExample")
        imageButton.setTitle("", for: .normal)
    }
    
    @IBAction func addPostButtonTapped(_ sender: UIButton) {
        if let image = imageView.image,
            let captionText = captionTextField.text,
            !captionText.isEmpty
        {
            PostController.shared.createPostWith(image: image, caption: captionText)
            
            //FIXME: Dismiss the view
            navigationController?.popViewController(animated: true)
        } else {
            let alertController = UIAlertController(title: "All data should be filled in", message: nil, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
        
    }
    @IBAction func cancelBarButtonItemTapped(_ sender: UIBarButtonItem) {
        // FIXME: Dismiss the view
        
    }
}
