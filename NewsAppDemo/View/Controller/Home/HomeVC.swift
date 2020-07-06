//
//  ViewController.swift
//  NewsAppDemo
//
//  Created by Emad Asker on 7/5/20.
//  Copyright © 2020 Emad Asker. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var mViewModel =  HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
         //tableView.register(NewsCell.self, forCellReuseIdentifier: "NewsCell")
        
        
        
        tableView.dataSource = self
        
       tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier:String.init(describing: NewsCell.self))
        
        registerObservers()
        mViewModel.loadHeadLine()
    }


    func registerObservers() {
        mViewModel.responseCallBack = { [weak self] (data) in
            guard let self = self else { return }
            self.tableView.reloadData()
            print("hello \(data.totalResults) articles on fire")
        }
        
        
        mViewModel.errorCallBack = { [weak self] (error) in
            print("Failed to load API with : \(error)")
        }
    }
}

