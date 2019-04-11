//
//  PostsWorker.swift
//  iOSCodeChallenge
//
//  Created by Pamela Zamboni on 11/04/2019.
//  Copyright © 2019 Pamela Zamboni. All rights reserved.
//

import UIKit

protocol PostsWorkerProtocol {
    func loadPostsFromServer(response: @escaping (PostResponse?) -> ())
}

class PostsWorker: PostsWorkerProtocol {
    
    func loadPostsFromServer(response: @escaping (PostResponse?) -> ()) {
        APIClient.sharedInstance.loadPosts(withCallBack: { (result, error) in
            response(result)
        })
    }
}
