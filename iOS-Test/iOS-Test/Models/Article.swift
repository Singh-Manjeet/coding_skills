//
//  Article.swift
//  iOS-Test
//
//  Created by Manjeet Singh on 13/2/18.
//  Copyright © 2018 Manjeet Singh. All rights reserved.
//

import Foundation

private class ArticleImage {
    let url: String
    let width: Int
    
    init(withURL url: String, width: Int) {
        self.url = url
        self.width = width
    }
}

class Article {
    
    var title: String
    var description: String
    var author: String
    var imageURLString: String?
    var detailURLString: String
    var timeStamp: TimeInterval
    
    init(title :String, description: String, author: String, imageURLString: String, detailURLString: String, timeStamp: TimeInterval) {
        self.title = title
        self.description = description
        self.author = author
        self.detailURLString = detailURLString
        self.timeStamp = timeStamp
    }
    
    init?(dictionary :JSONDictionary) {
        
        guard let title = dictionary[APIKeys.Article.title] as? String,
              let description = dictionary[APIKeys.Article.description] as? String,
              let author = dictionary[APIKeys.Article.author] as? String,
              let detailURL = dictionary[APIKeys.Article.detailURL] as? String,
              let timeStamp = dictionary[APIKeys.Article.timeStamp] as? Double else { return nil }
        
        self.title = title
        self.description = description
        self.author = author
        self.detailURLString = detailURL
        self.timeStamp = timeStamp
        
        if let imageURLs = dictionary[APIKeys.Article.imageURLs] as? [Dictionary<String, Any>],
           let imageURL = imageURLs.first!["url"] as? String {
            self.imageURLString = imageURL
        }
    }
    
}
