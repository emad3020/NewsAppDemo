//
//  NewsCell.swift
//  NewsAppDemo
//
//  Created by Emad Asker on 7/6/20.
//  Copyright © 2020 Emad Asker. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(with article : Article) {
        title.text = article.title ?? "Null"
    }
    
}
