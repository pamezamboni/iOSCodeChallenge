//
//  PostsViewController.swift
//  iOSCodeChallenge
//
//  Created by Pamela Zamboni on 11/04/2019.
//  Copyright © 2019 Pamela Zamboni. All rights reserved.
//

import UIKit

protocol PostsDisplayLogic: class {
    func displayPosts(viewModel: PostsViewModels.Data.ViewModel)
}

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
    
    var interactor: PostsInteractor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        setup()
        getAllPosts()
    }
    
    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 64
        tableView.tableFooterView = UIView()
    }
    
    func setup() {
        let interactor = PostsInteractor()
        let presenter = PostsPresenter()
        
        interactor.presenter = presenter
        presenter.viewController = self
        
        self.interactor = interactor
    }
    
    func getAllPosts() {
        let request = PostsViewModels.Data.Request()
        interactor?.loadPosts(request: request)
    }
}

extension PostsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPosts?.count ?? 0
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
            cell.thumbnailImg?.download(from: urlString)
        }
        cell.commentsCountLb.text = post.comments?.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension PostsViewController: PostsDisplayLogic {
    func displayPosts(viewModel: PostsViewModels.Data.ViewModel) {
        allPosts = viewModel.posts
    }
}
