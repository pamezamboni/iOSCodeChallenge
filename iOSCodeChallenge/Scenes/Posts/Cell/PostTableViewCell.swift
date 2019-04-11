//
//  PostTableViewCell.swift
//  iOSCodeChallenge
//
//  Created by Pamela Zamboni on 11/04/2019.
//  Copyright © 2019 Pamela Zamboni. All rights reserved.
//

import UIKit

protocol PostCellDelegate: class {
    func userWantToDissmissPost(fromCell cell:PostTableViewCell)
}

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImg: UIImageView!
    @IBOutlet weak var readStatusView: UIView!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var authorLb: UILabel!
    @IBOutlet weak var entryDateLb: UILabel!
    @IBOutlet weak var commentsCountLb: UILabel!
    
    var postData: Post? {
        didSet {
            if let post = postData {
                readStatusView.isHidden = !(post.unread)
                titleLb.text = post.title
                authorLb.text = post.author
                entryDateLb.text = post.entryDate?.description
                if let urlString = post.thumbnailUrlString {
                    thumbnailImg?.download(from: urlString)
                }
                commentsCountLb.text = post.comments?.description
            }
        }
    }
    
    weak var cellDelegate: PostCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func dismissPost(_ sender: Any) {
        cellDelegate?.userWantToDissmissPost(fromCell: self)
    }
    
}
