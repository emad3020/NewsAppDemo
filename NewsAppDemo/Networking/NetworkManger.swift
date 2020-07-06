//
//  NetworkManger.swift
//  NewsAppDemo
//
//  Created by Emad Asker on 7/5/20.
//  Copyright © 2020 Emad Asker. All rights reserved.
//

import Foundation
import Moya
import Result

class NetworkManger {
    static let environment : NetworkEnvironment = .development
    
    fileprivate let provider = MoyaProvider<EndPointAPI>()
    
    func performRequest<T : Codable>(_ target: EndPointAPI,completion : @escaping ((_ response : T?) -> Void)) {
        
        provider.request(target) { result in
            switch result {
            case .success(let response):
                do {
                    let apiResponse = try JSONDecoder().decode(T.self,from: response.data)
                    completion(apiResponse)
                } catch(let exError){
                    print(#function , exError)
                    completion(nil)
                }
            case .failure(let error):
                print(#function , "error: \(error) in target \(target)")
                completion(nil)
            }
        }
    }
}
