//
//  NewViewController.swift
//  HelloWebView
//
//  Created by 洪德晟 on 2016/10/14.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import UIKit
// 1. 匯入函式庫 for MKWebView
import WebKit

// 1. 匯入函式庫 for SFController
import SafariServices

class NewViewController: UIViewController {
    
    // 方法四：用 SFController 來開網頁
    @IBAction func useSFController(_ sender: UIBarButtonItem) {
        // 2. 用網址產生 URL
        if let url = URL(string: "http://www.books.com.tw") {
            // 3. 生出 SafariViewController
            let safariController = SFSafariViewController(url: url)
            // 4. 推出 SafariViewController
            present(safariController, animated: true, completion: nil)
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 2. WebView 的範圍
        let area = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        // 3. 有了範圍，產生WebView
        let myWebView = WKWebView(frame: area)
        
        // 4. 把 WebView 加到畫面
        view.addSubview(myWebView)
        
        // 5. 用網址產生 URL
        if let url = URL(string: "http:tw.yahoo.com") {
            
            // 6. 用 URL 產生 request
            let request = URLRequest(url: url)
            
            // 7. 請網頁去 load request
            myWebView.load(request)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
