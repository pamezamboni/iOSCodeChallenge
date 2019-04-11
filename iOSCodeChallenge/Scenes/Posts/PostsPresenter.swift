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
    
    func presentPosts(response: PostsViewModels.Data.Response)
    {
        let viewModel = PostsViewModels.Data.ViewModel(posts: response.posts)
        viewController?.displayPosts(viewModel: viewModel)
    }
}
