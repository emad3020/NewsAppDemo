//
//  HeadLineModel.swift
//  NewsAppDemo
//
//  Created by Emad Asker on 7/5/20.
//  Copyright © 2020 Emad Asker. All rights reserved.
//

import Foundation
struct HeadLineModel: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
