//
//  HomeViewModel.swift
//  NewsAppDemo
//
//  Created by Emad Asker on 7/5/20.
//  Copyright © 2020 Emad Asker. All rights reserved.
//

import Foundation

class HomeViewModel : BaseViewModel {
    var responseCallBack: ((HeadLineModel?) -> Void)?
    
    var errorCallBack: ((String?) -> Void)?
    
    typealias T = HeadLineModel
    
    public var articlesArray = [Article]()

    func loadHeadLine() {
        NewsRepo.instance.getHeadLines { response in
            if let response = response {
                self.articlesArray = response.articles
                self.responseCallBack?(response)
            } else {
                self.errorCallBack?("No data fount")
            }
        }
    }
    
}
