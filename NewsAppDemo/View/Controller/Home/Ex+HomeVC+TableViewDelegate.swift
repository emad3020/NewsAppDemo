//
//  Ex+HomeVC+TableViewDelegate.swift
//  NewsAppDemo
//
//  Created by Emad Asker on 7/6/20.
//  Copyright © 2020 Emad Asker. All rights reserved.
//

import Foundation
import UIKit

extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
