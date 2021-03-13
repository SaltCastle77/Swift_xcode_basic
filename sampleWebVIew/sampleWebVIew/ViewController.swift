//
//  ViewController.swift
//  sampleWebVIew
//
//  Created by 염성훈 on 2021/03/13.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet var WebViewMain: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 1. url string
        // 2. url > request
        // 3. req > load 로 뿌린다.
        
        let urlString = "https:///www.google.com"
        if let url = URL(string: urlString) { //옵셔널 바인딩 : 안전하게 코딩해볼 수 있게 한다.
            let urlReq = URLRequest(url: url)
            WebViewMain.load(urlReq)
        }
        
        //null Pointer Exception - java
     }


    
    
}

