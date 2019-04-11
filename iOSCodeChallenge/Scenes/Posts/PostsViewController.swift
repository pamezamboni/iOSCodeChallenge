//
//  PostsViewController.swift
//  iOSCodeChallenge
//
//  Created by Pamela Zamboni on 11/04/2019.
//  Copyright © 2019 Pamela Zamboni. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var allPosts: [Post]? = [] {
        didSet {
            if allPosts != nil {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }
    
    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 64
        tableView.tableFooterView = UIView()
    }
}

extension PostsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let allPosts = allPosts, let cell = tableView.dequeueReusableCell(withIdentifier: Constants.postCellIdentifier, for: indexPath) as? PostTableViewCell else {
            return UITableViewCell()
        }
        
        let post = allPosts[indexPath.row]
        cell.titleLb.text = post.title
        cell.authorLb.text = post.author
        cell.entryDateLb.text = post.entryDate?.description
        if let urlString = post.thumbnailUrlString {
            cell.imageView?.download(from: urlString)
        }
        cell.commentsCountLb.text = post.comments?.description
        return cell
    }
    
    
}
