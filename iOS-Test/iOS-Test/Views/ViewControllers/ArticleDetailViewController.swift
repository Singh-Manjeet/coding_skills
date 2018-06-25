//
//  ArticleDetailViewController.swift
//  iOS-Test
//
//  Created by Manjeet Singh on 14/2/18.
//  Copyright © 2018 Manjeet Singh. All rights reserved.
//

import Foundation
import UIKit
import WebKit

struct DesignConstants {
    static let accessibilityIdentifier = "Article Details"
}

class ArticleDetailViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet fileprivate weak var webView: WKWebView!
    @IBOutlet fileprivate weak var loadingIndicator: UIActivityIndicatorView!
    
    // MARK: - Vars
    var url: URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = DesignConstants.accessibilityIdentifier
        view.accessibilityIdentifier = DesignConstants.accessibilityIdentifier
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupUI()
    }
    
    private func setupUI() {
        webView.navigationDelegate = self
        webView.load(URLRequest(url: url))
    }
}

// MARK: - WKNavigationDelegate
extension ArticleDetailViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingIndicator.stopAnimating()
    }
}
