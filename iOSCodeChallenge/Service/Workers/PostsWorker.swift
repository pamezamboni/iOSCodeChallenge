//
//  PostsWorker.swift
//  iOSCodeChallenge
//
//  Created by Pamela Zamboni on 11/04/2019.
//  Copyright © 2019 Pamela Zamboni. All rights reserved.
//

import UIKit

protocol PostsWorkerProtocol {
    func loadPostsFromServer(response: @escaping ([Post]?) -> ())
}

class PostsWorker: PostsWorkerProtocol {
    
    func loadPostsFromServer(response: @escaping ([Post]?) -> ()) {
        //call to API client
    }
}
