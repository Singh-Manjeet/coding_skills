//
//  ArticleViewModel.swift
//  iOS-Test
//
//  Created by Manjeet Singh on 13/2/18.
//  Copyright © 2018 Manjeet Singh. All rights reserved.
//

import Foundation

struct ArticleListViewModel {
    // MARK: - Vars
    var title :String? = "Articles"
    var articles :[ArticleViewModel] = [ArticleViewModel]()
}

extension ArticleListViewModel {
    init(articles :[ArticleViewModel]) {
        self.articles = articles
    }
}

struct ArticleViewModel {
    var title :String
    var description :String
    var author: String
    var imageURLString: String?
    var detailURLString: String
    var timeStamp: TimeInterval
}

extension ArticleViewModel {
    
    init(article :Article) {
        self.title = article.title
        self.description = article.description
        self.author = article.author
        self.imageURLString = article.imageURLString
        self.detailURLString = article.detailURLString
        self.timeStamp = article.timeStamp
    }
}
