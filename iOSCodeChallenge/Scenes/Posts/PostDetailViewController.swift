//
//  PostDetailViewController.swift
//  iOSCodeChallenge
//
//  Created by Pamela Zamboni on 11/04/2019.
//  Copyright © 2019 Pamela Zamboni. All rights reserved.
//

import UIKit

class PostDetailViewController: UIViewController {
    
    var postSelected: Post? {
        didSet {
            titleLb.text = ""
            if let post = postSelected {
                loadViewIfNeeded()
                titleLb.text = post.title ?? ""
                if let urlString = post.thumbnailUrlString {
                    imageView.download(from: urlString)
                }
                
                if titleLb.isHidden { titleLb.isHidden = false }
                if imageView.isHidden { imageView.isHidden = false }
                
            } else {
                imageView.isHidden = true
            }
        }
    }
    
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func imageTapped(_ sender: Any) {
        if let image = imageView.image {
            let customModal = showImageInModal(image: image)
            self.present(customModal, animated: true, completion: nil)
        }
    }
}

extension PostDetailViewController: PostsListDelegate {
    func userDidSelectedPost(_ postSelected: Post?) {
        self.postSelected = postSelected
    }
}

