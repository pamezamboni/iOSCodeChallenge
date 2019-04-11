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
                if downloadBt.isHidden { downloadBt.isHidden = false }
                
            } else {
                imageView.isHidden = true
                downloadBt.isHidden = true
            }
        }
    }
    
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var downloadBt: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func downloadImage(_ sender: Any) {
        if let image = imageView.image {
            UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        }
    }
    
    @IBAction func imageTapped(_ sender: Any) {
        if let image = imageView.image {
            let customModal = showImageInModal(image: image)
            self.present(customModal, animated: true, completion: nil)
        }
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            showAlert(title: "Save error", message: error.localizedDescription)
        } else {
            showAlert(title: "Saved!", message: "The image has been saved.")
        }
    }
}

extension PostDetailViewController: PostsListDelegate {
    func userDidSelectedPost(_ postSelected: Post?) {
        self.postSelected = postSelected
    }
}

