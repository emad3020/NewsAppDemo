//
//  NewsRepo.swift
//  NewsAppDemo
//
//  Created by Emad Asker on 7/5/20.
//  Copyright © 2020 Emad Asker. All rights reserved.
//

import Foundation


class NewsRepo {
    static let instance = NewsRepo()
    fileprivate  let networkManager = NetworkManger()
    
    typealias completionHanlder = (_  response : HeadLineModel?) -> Void
    func getHeadLines(completion : @escaping completionHanlder) {
        networkManager.performRequest(.loadHeadLines(country: "eg", apiKey: "241380e680fd457ca28ec918ee92e1b8"), completion: completion)
    }
    
}
