//
//  ViewController.swift
//  HelloWebView
//
//  Created by 洪德晟 on 2016/10/14.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    // 方法三：要打開手機的 Safari
    @IBAction func useSafariApp(_ sender: UIBarButtonItem) {
        // 1. 用網址產生 URL
        if let url = URL(string: "http://www.google.com") {
            // 2. 打開 Safari
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
            
        }
    }
    
    // WebView超強，什麼都給他顯示就好了...
    @IBOutlet weak var oldWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1. 用網址產生 URL
        if let url = URL(string: "http://www.apple.com") {
            // 2. 用URL 產生 request
            let request = URLRequest(url: url)
            // 3. 請 WebView 去 loadrequest
            oldWebView.loadRequest(request)
            
        }
        
        // 使用代理
        oldWebView.delegate = self
        
//        // 其他一：Load 用Html寫的網頁
//        oldWebView.loadHTMLString("<h1>Hello<h1> <p>hey what's up?<p>", baseURL: nil)
//        
//        // 其他二：Load 寫好的網頁
//        if let htmlFile = Bundle.main.path(forResource: "index", ofType: "html") {
//            do {
//                // 把檔案轉成字串
//                let html = try String(contentsOfFile: htmlFile, encoding: String.Encoding.utf8)
//                
//                oldWebView.loadHTMLString(html, baseURL: nil)
//            } catch {
//                print("Can not load webview")
//            }
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - WebViewDelegate
    
    // 剛開始 load 會執行這個
    func webViewDidStartLoad(_ webView: UIWebView) {
        // 就讓他開始轉
        myActivityIndicator.startAnimating()
    }
    
    // load 完會開始執行這個
    func webViewDidFinishLoad(_ webView: UIWebView) {
        // 就讓它停止
        myActivityIndicator.stopAnimating()
        
    }
    
    // 要連到別的網頁會執行這個
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if let urlString = request.url?.absoluteString {
            if urlString.hasPrefix("http://abcqqqccc") {
                myActivityIndicator.stopAnimating()
                // ...做你想要做的事情
            }
        }
        return true
    }
    
}

