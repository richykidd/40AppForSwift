//
//  ViewController.swift
//  15-webView
//
//  Created by Richy Li on 16/12/31.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        text.delegate = self
        webView.delegate = self
    }

    func loadUrl(_ url: String, web: UIWebView){
    
        let aUrl = URL(string: ("https://" + url))
        let urlRequest = URLRequest(url: aUrl!)
        web.loadRequest(urlRequest)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        loadUrl(textField.text!, web: webView)
        textField.resignFirstResponder()
        return true
    }

    func webViewDidStartLoad(_ webView: UIWebView) {
        loading.startAnimating()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        loading.stopAnimating()
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}

