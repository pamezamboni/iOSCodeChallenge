//
//  PostsInteractor.swift
//  iOSCodeChallenge
//
//  Created by Pamela Zamboni on 11/04/2019.
//  Copyright © 2019 Pamela Zamboni. All rights reserved.
//

import UIKit

protocol PostsBusinessLogic {
    func loadPosts(request: PostsViewModels.Data.Request)
}

class PostsInteractor: PostsBusinessLogic {
    
    var presenter: PostsPresentationLogic?
    var worker: PostsWorkerProtocol = PostsWorker()
    
    func loadPosts(request: PostsViewModels.Data.Request)
    {
        worker.loadPostsFromServer { (result) in
            let response = PostsViewModels.Data.Response(posts: result)
            self.presenter?.presentPosts(response: response)
        }
    }
}
