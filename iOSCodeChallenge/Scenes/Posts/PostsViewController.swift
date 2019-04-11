//
//  PostsViewController.swift
//  iOSCodeChallenge
//
//  Created by Pamela Zamboni on 11/04/2019.
//  Copyright © 2019 Pamela Zamboni. All rights reserved.
//

import UIKit

protocol PostsListDelegate: class {
    func userDidSelectedPost(_ postSelected: Post?)
}

protocol PostsDisplayLogic: class {
    func displayPosts(viewModel: PostsViewModels.Data.ViewModel)
}

class PostsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var selectedCell: PostTableViewCell?
    
    var allPosts: [Post] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var interactor: PostsInteractor?
    
    weak var postsDelegate: PostsListDelegate?
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(self.handleRefresh(_:)),
                                 for: UIControl.Event.valueChanged)
        refreshControl.tintColor = UIColor.gray
        
        return refreshControl
    }()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        setup()
        getAllPosts()
    }
    
    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 160
        tableView.estimatedRowHeight = 64
        tableView.tableFooterView = UIView()
        tableView.addSubview(self.refreshControl)
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
    
    @IBAction func dismissAllPosts(_ sender: Any) {
        tableView.beginUpdates()
        let postCount = allPosts.count
        allPosts.removeAll()
        var allIndexPath: [IndexPath] = []
        for index in 0..<postCount {
            allIndexPath.append(IndexPath(row: index, section: 0))
        }
        tableView.deleteRows(at: allIndexPath, with: .left)
        tableView.endUpdates()
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        getAllPosts()
        refreshControl.endRefreshing()
    }
}

extension PostsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.postCellIdentifier, for: indexPath) as? PostTableViewCell else {
            return UITableViewCell()
        }
        
        cell.postData = allPosts[indexPath.row]
        cell.cellDelegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPost = allPosts[indexPath.row]
        if let selected = tableView.cellForRow(at: indexPath) as? PostTableViewCell {
            selectedCell = selected
        }
        
        if selectedPost.unread {
            selectedPost.unread = false
            allPosts[indexPath.row] = selectedPost
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
        
        updateDetailPost(fromDataPost: selectedPost)
        
    }
    
    func updateDetailPost(fromDataPost dataPost: Post?) {
        postsDelegate?.userDidSelectedPost(dataPost)
        
        if let detailViewController = postsDelegate as? PostDetailViewController{
            splitViewController?.showDetailViewController(detailViewController, sender: nil)
        }
    }
}

extension PostsViewController: PostsDisplayLogic {
    func displayPosts(viewModel: PostsViewModels.Data.ViewModel) {
        guard let posts = viewModel.posts else { return }
        allPosts = posts
    }
}

extension PostsViewController: PostCellDelegate {
    func userWantToDissmissPost(fromCell cell: PostTableViewCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            
            updateDetailPost(fromDataPost: nil)
            allPosts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
    
}
