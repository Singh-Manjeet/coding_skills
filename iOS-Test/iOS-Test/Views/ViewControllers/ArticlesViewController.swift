//
//  ArticlesViewController.swift
//  iOS-Test
//
//  Created by Manjeet Singh on 13/2/18.
//  Copyright © 2018 Manjeet Singh. All rights reserved.
//

import Foundation
import UIKit

struct TableViewConstants {
    static let accessibilityIdentifier = "ArticlesTableView"
}

fileprivate struct Design {
    static let headerHeight: CGFloat = 44.0
    static let defaultMargin: CGFloat = 11.0
    static let estimatedTableViewRowHeight: CGFloat = 300.0
}

class ArticlesViewController: UIViewController {
    // MARK: - Variables
    fileprivate var previousScrollOffset: CGFloat = 0
    fileprivate var viewModel :ArticleListViewModel = ArticleListViewModel()  {
        didSet {
            tableView.reloadData()
        }
    }
    
    var didSelect: (ArticleViewModel) -> () = { _ in }
    var addArticleTapped: () -> () = {}
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet fileprivate weak var titleLabel: UILabel!
    @IBOutlet fileprivate weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.viewModel.title
        
        loadArticles()
    }
}
// MARK: - TableView DataSource
extension ArticlesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let articleViewModel = viewModel.articles[indexPath.row]
        didSelect(articleViewModel)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCellIdentifier", for: indexPath) as! ArticleTableViewCell
        cell.populate(withArticle: viewModel.articles[indexPath.row])
        cell.accessibilityIdentifier = String(format: "ArticlesTableViewCell_%d", indexPath.row)
        
        return cell
    }
}

// MARK: - Private Helpers
fileprivate extension ArticlesViewController {
    func setupUI() {
        activityIndicator.startAnimating()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = Design.estimatedTableViewRowHeight
        tableView.backgroundColor = .clear
        tableView.sectionFooterHeight = CGFloat.leastNonzeroMagnitude
        tableView.sectionHeaderHeight = Design.headerHeight
        tableView.separatorInset = .zero
        tableView.accessibilityIdentifier = TableViewConstants.accessibilityIdentifier
    }
    
    func loadArticles() {
        
        // this url should be part of the URL builder scheme and not right inside the
        guard let url = URL(string: APIConstants.baseURL) else { return }
        
        // this web service should use generic types. Again this is not part of the implementation
        // as we are focusing on MVVM model
        Networking().getArticles(url: url) { articles in
            let articles = articles.map { article in
                return ArticleViewModel(article :article)
            }
            
            self.viewModel = ArticleListViewModel(articles :articles)
            
        }
    }
}
