//
//  HomeViewModel.swift
//  NewsAppDemo
//
//  Created by Emad Asker on 7/5/20.
//  Copyright © 2020 Emad Asker. All rights reserved.
//

import Foundation

class HomeViewModel /*: BaseViewModel*/ {
    // typealias T = HeadLineModel
    
    
    public var responseCallBack: ((HeadLineModel)->Void)?
    public var errorCallBack: ((String?) -> Void)?
    
    fileprivate var currentItem : HeadLineModel?
    
    public var articlesArray : [Article] {
        get{
            return currentItem?.articles ?? [Article]()
        }
    }

    func loadHeadLine() {
        NewsRepo.instance.getHeadLines { response in
            if let response = response {
                self.currentItem = response
                self.responseCallBack?(response)
            } else {
                self.errorCallBack?("No data fount")
            }
        }
    }
    
}
