//
//  ViewController.swift
//  AmmoFinder
//
//  Created by Chakane Shegog on 8/1/21.
//

import UIKit
import WebKit

class ViewController: UIViewController {
let LGhandGunAmmo = "https://www.luckygunner.com/handgun"
    
    let webView: WKWebView = {
        let prefs = WKPreferences()
        prefs.javaScriptEnabled = true
        let config = WKWebViewConfiguration()
        config.preferences = prefs
        let webView = WKWebView(frame: .zero, configuration: config)
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        webView.frame = view.bounds
        webView.navigationDelegate = self
        guard let url = URL(string: LGhandGunAmmo) else {
            return
        }
        webView.load(URLRequest(url: url))
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        scrapeHandgun()
    }
    
    func scrapeHandgun() {
        webView.evaluateJavaScript("document.body.innerHTML") { result, error in
            guard let html = result, error == nil else {
                return
            }
            print(html)
        }
    }
    
}

