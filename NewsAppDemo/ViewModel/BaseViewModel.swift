//
//  BaseViewModel.swift
//  NewsAppDemo
//
//  Created by Emad Asker on 7/5/20.
//  Copyright © 2020 Emad Asker. All rights reserved.
//

import Foundation

protocol  BaseViewModel  {
    associatedtype T
    var responseCallBack : ((_ response : T?) -> Void)?  { get set}
    
     var errorCallBack : ((_ message : String?) -> Void)?  { get set}
    
}
