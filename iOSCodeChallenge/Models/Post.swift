//
//  Post.swift
//  iOSCodeChallenge
//
//  Created by Pamela Zamboni on 11/04/2019.
//  Copyright © 2019 Pamela Zamboni. All rights reserved.
//

import UIKit

class Post: NSObject {

    var title: String?
    var unread: Bool = true
    var entryDate: Int?
    var author: String?
    var comments: Int?
    var thumbnailUrlString: String?
}
