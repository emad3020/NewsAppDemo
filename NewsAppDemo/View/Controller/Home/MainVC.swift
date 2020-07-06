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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newsTableView.delegate = self
        newsTableView.dataSource = self
        
        newsTableView.register(UINib(nibName: "\(TopNewsCell.self)", bundle: nil), forCellReuseIdentifier: "\(TopNewsCell.self)")
    
        
        registerObservers()
        mViewModel.loadHeadLine()
    }
    
    
    func registerObservers() {
        mViewModel.responseCallBack = { [weak self] (data) in
            guard let self = self else { return }
            self.newsTableView.reloadData()
        }
        
        
        mViewModel.errorCallBack = { [weak self] (error) in
            print("Failed to load API with : \(error)")
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
