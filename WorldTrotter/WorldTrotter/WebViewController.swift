//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Bart Jung on 25/11/2017.
//  Copyright © 2017 Bart Jung. All rights reserved.
//

import Foundation
import WebKit
import UIKit

class WebViewController: UIViewController {
    var webView: WKWebView!
    
    override func loadView() {
        print("WebView loadView called")
        
        webView = WKWebView()
        view = webView
        
        let myURL = URL(string: "https://www.bignerdranch.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("WebView loaded")
    }
}
