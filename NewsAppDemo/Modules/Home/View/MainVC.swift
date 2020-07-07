//
//  MainVC.swift
//  NewsAppDemo
//
//  Created by Emad Ahmed on 7/6/20.
//  Copyright © 2020 Emad Asker. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var newsTableView : UITableView!
    
    var mViewModel =  HomeViewModel()
    var refreshController = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newsTableView.delegate = self
        newsTableView.dataSource = self
        
        refreshController.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshController.addTarget(self, action: #selector(self.refreshNews(_:)), for: .valueChanged)
        newsTableView.addSubview(refreshController)
        
        newsTableView.register(UINib(nibName: "\(TopNewsCell.self)", bundle: nil), forCellReuseIdentifier: "\(TopNewsCell.self)")
    
        
        registerObservers()
        mViewModel.loadHeadLine()
    }
    
    
    @objc func refreshNews(_ sender : AnyObject) {
        mViewModel.loadHeadLine()
    }
    
    func registerObservers() {
        mViewModel.responseCallBack = { [weak self] (data) in
            guard let self = self else { return }
            self.newsTableView.reloadData()
            
            self.refreshController.endRefreshing()
        }
        
        
        mViewModel.errorCallBack = { [weak self] (error) in
            guard let self = self else { return }
            let errorAlert =  UIAlertController(title: "Error", message: error ?? "", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
            errorAlert.addAction(okAction)
            self.present(errorAlert, animated: false)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsSegue" {
            if let destination = segue.destination as? SafariVC {
                destination.newsUrl = sender as? String
            }
        }
    }

}
