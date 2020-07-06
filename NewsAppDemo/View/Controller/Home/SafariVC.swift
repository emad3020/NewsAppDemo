//
//  SafariVC.swift
//  NewsAppDemo
//
//  Created by Emad Ahmed on 7/6/20.
//  Copyright © 2020 Emad Asker. All rights reserved.
//

import UIKit
import WebKit

class SafariVC: UIViewController {
    var newsUrl : String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let webView = WKWebView()
        guard let url = URL(string: newsUrl) else { return }
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        view = webView
    }
    
    

}
