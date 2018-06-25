//
//  Networking.swift
//  iOS-Test
//
//  Created by Manjeet Singh on 13/2/18.
//  Copyright © 2018 Manjeet Singh. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String:Any]


/**
 * This architecture can further extended by blending redux for .e.g Store, Actions, Container.
 * Which helps to maintain the state of the data
 * Parameters: articleViewModel
 *
 * i could use cocoa pods, alamofire to fetch the data.
 */


/**
 * Networking
 * Fetches the data from API
 */
class Networking {
    
    func getArticles(url :URL, callback :@escaping ([Article]) -> ()) {
        
        var articles = [Article]()
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
                
                let json = try! JSONSerialization.jsonObject(with: data, options: [])
                let dictionary = json as! JSONDictionary
                
                let articleDictionaries = dictionary[APIKeys.Articles] as! [JSONDictionary]
                
                articles = articleDictionaries.flatMap { dictionary in
                    return Article(dictionary :dictionary)
                }
            }
            
            articles.sort { $0.timeStamp < $1.timeStamp }
            
            DispatchQueue.main.async {
                callback(articles)
            }
            
            }.resume()
        
    }
    
}
