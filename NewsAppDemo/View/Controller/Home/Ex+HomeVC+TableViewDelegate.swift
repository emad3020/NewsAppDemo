//
//  Ex+HomeVC+TableViewDelegate.swift
//  NewsAppDemo
//
//  Created by Emad Asker on 7/6/20.
//  Copyright © 2020 Emad Asker. All rights reserved.
//

import Foundation
import UIKit

extension MainVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailsSegue", sender: mViewModel.articlesArray[indexPath.row].url!)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
