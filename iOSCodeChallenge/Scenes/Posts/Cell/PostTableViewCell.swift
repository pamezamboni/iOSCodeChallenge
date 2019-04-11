//
//  PostTableViewCell.swift
//  iOSCodeChallenge
//
//  Created by Pamela Zamboni on 11/04/2019.
//  Copyright © 2019 Pamela Zamboni. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImg: UIImageView!
    @IBOutlet weak var readStatusView: UIView!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var authorLb: UILabel!
    @IBOutlet weak var entryDateLb: UILabel!
    @IBOutlet weak var commentsCountLb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func dismissPost(_ sender: Any) {
    }
    
    
}
