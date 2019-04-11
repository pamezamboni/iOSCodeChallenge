//
//  PostsPresenter.swift
//  iOSCodeChallenge
//
//  Created by Pamela Zamboni on 11/04/2019.
//  Copyright © 2019 Pamela Zamboni. All rights reserved.
//

import UIKit

protocol PostsPresentationLogic {
    func presentPosts(response: PostsViewModels.Data.Response)
}

class PostsPresenter: PostsPresentationLogic {
    weak var viewController: PostsDisplayLogic?
    
    func presentPosts(response: PostsViewModels.Data.Response) {
        
        var allPosts: [Post] = []
        
        if let postResponse = response.posts {
            let posts = postResponse.data.children
            for item in posts {
                let post = Post()
                post.title = item.data.title
                post.author = item.data.author
                post.thumbnailUrlString = item.data.thumbnail
                post.comments = item.data.numComments
                allPosts.append(post)
            }
        }
        
        let viewModel = PostsViewModels.Data.ViewModel(posts: allPosts)
        viewController?.displayPosts(viewModel: viewModel)
    }
}
