//
//  Router.swift
//  iOS-Test
//
//  Created by Manjeet Singh on 13/2/18.
//  Copyright © 2018 Manjeet Singh. All rights reserved.
//

import Foundation
import UIKit

/**
 * Router helps to navigate within the app
 */
class Router {
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let navigationController :UINavigationController
    
    init(window :UIWindow) {
        
        navigationController = window.rootViewController as! UINavigationController
        
        guard let articleListTVC = navigationController.viewControllers.first as? ArticlesViewController else {
            fatalError("ArticlesViewController does not exist")
        }
        
        articleListTVC.didSelect = showArticleDetails
    }
    
    private func showArticleDetails(articleViewModel :ArticleViewModel) {
        
        let articleDetailVC = storyboard.instantiateViewController(withIdentifier: "ArticleDetailViewController") as! ArticleDetailViewController

        guard let url = URL(string: articleViewModel.detailURLString) else { return }

        articleDetailVC.url = url
        navigationController.pushViewController(articleDetailVC, animated: true)
    }
    
}


