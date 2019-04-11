//
//  PostsViewModels.swift
//  iOSCodeChallenge
//
//  Created by Pamela Zamboni on 11/04/2019.
//  Copyright © 2019 Pamela Zamboni. All rights reserved.
//

import UIKit

enum PostsViewModels
{
    // MARK: Use cases
    
    enum Data
    {
        struct Request {
        }
        
        struct Response {
            var posts: [Post]? = []
        }
        
        struct ViewModel {
            var posts: [Post]? = []
        }
    }
}
