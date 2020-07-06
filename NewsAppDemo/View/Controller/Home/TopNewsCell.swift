//
//  TopNewsCell.swift
//  NewsAppDemo
//
//  Created by Emad Ahmed on 7/6/20.
//  Copyright © 2020 Emad Asker. All rights reserved.
//

import UIKit
import Kingfisher

class TopNewsCell: UITableViewCell {

    @IBOutlet weak var newsTitleLabel : UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var publishDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public var article : Article! {
        didSet {
            newsTitleLabel.text = article.title
            authorLabel.text = article.author
            publishDateLabel.text = article.publishedAt
            
            if let url = URL(string: article.urlToImage ?? ""){
              newsImage.kf.setImage(with: url)
            }
            
        }
    }
    
}
