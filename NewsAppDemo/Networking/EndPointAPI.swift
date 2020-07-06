//
//  EndPointAPI.swift
//  NewsAppDemo
//
//  Created by Emad Asker on 7/5/20.
//  Copyright © 2020 Emad Asker. All rights reserved.
//

import Foundation
import Moya
import Alamofire

enum NetworkEnvironment{
    case development
}


enum EndPointAPI{
    case loadHeadLines(country: String, apiKey : String)
}


extension EndPointAPI : TargetType {
    private var environmentBaseUrl : String {
        switch NetworkManger.environment {
        case .development:
            return "http://newsapi.org/v2/"
            
        }
    }
    
    public var baseURL: URL {
        guard let url = URL(string: environmentBaseUrl) else {
            fatalError("BaseURL can't be configured")
        }
        
        return url
    }
    
    
    public var path: String {
        switch self {
        case .loadHeadLines :
            return "top-headlines"
        }
    }
    
    
    public var method: Alamofire.HTTPMethod {
        switch self {
        case .loadHeadLines:
            return .get
        }
    }
    
    
    public var task: Task {
        switch self {
        case .loadHeadLines(let country, let apiKey):
            let paramter = ["country" : country, "apiKey" : apiKey]
            return .requestParameters(parameters: paramter, encoding: URLEncoding.default)
        }
    }
    
    
   public var parameterEncoding: ParameterEncoding {
        switch self {
            case .loadHeadLines:
                return URLEncoding.default
        }
    }
    
    public var headers: [String : String]? {
        switch self {
        case .loadHeadLines:
            return nil
        }
    }
    
    public var sampleData: Data {
        switch self {
        default:
            return Data()
            
        }
    }
}

