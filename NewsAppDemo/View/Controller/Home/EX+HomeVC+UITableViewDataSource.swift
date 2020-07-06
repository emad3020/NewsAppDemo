//
//  EX+HomeVC+UITableViewDataSource.swift
//  NewsAppDemo
//
//  Created by Emad Asker on 7/6/20.
//  Copyright © 2020 Emad Asker. All rights reserved.
//

import Foundation
import UIKit

extension HomeVC : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mViewModel.articlesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String.init(describing: NewsCell.self)) as? NewsCell else { return UITableViewCell() }
        let article = mViewModel.articlesArray[indexPath.row]
        cell.configureCell(with: article)
        
        return cell
    }
}
