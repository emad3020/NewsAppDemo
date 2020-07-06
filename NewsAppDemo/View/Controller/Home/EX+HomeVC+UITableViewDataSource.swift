//
//  EX+HomeVC+UITableViewDataSource.swift
//  NewsAppDemo
//
//  Created by Emad Asker on 7/6/20.
//  Copyright © 2020 Emad Asker. All rights reserved.
//

import Foundation
import UIKit

extension MainVC : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  mViewModel.articlesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(TopNewsCell.self)", for: indexPath) as? TopNewsCell
         let article = mViewModel.articlesArray[indexPath.row]
        cell?.article = article
        
        return cell!
    }
    
}
