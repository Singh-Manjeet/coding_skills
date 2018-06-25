//
//  ArticlesTableViewTests.swift
//  iOS-TestUITests
//
//  Created by Manjeet Singh on 15/2/18.
//  Copyright © 2018 Manjeet Singh. All rights reserved.
//

import XCTest
@testable import iOS_Test

/**
 * To test if the table view displays the data correctly
 */
class ArticlesTableViewTests: XCTestCase {
    var viewController: ArticlesViewController!
    
    override func setUp() {
        super.setUp()
        
        let bundle = Bundle(for: type(of: self))
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        
        guard let navigationController = storyboard.instantiateInitialViewController() as? UINavigationController else {
            XCTFail()
            return
        }
        
        viewController = navigationController.viewControllers.first as! ArticlesViewController
        viewController.beginAppearanceTransition(true, animated: false)
    }
    
    override func tearDown() {
        super.tearDown()
        viewController.endAppearanceTransition()
    }
    
    
    func testNumberOfRowsEqualsToArticlesCountFromNetwork() {
        guard let tableView = viewController.tableView else {
            XCTFail()
            return
        }
        
        var numberOfResults = 0
        Networking().getArticles(url: URL(string: APIConstants.baseURL)!) { (results) in
            numberOfResults = results.count
        }
        
        XCTAssertEqual(numberOfResults, tableView.dataSource?.tableView(tableView, numberOfRowsInSection: 0))
    }
}
