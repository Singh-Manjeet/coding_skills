//
//  NavigationTest.swift
//  iOS-TestUITests
//
//  Created by Manjeet Singh on 13/2/18.
//  Copyright © 2018 Manjeet Singh. All rights reserved.
//

import XCTest

/**
 * To determine if the navigation on tapping the article takes place correctly
 */
class NavigationTest: XCTestCase {
    
    var app: XCUIApplication!
    
    // MARK: - XCTestCase
    
    override func setUp() {
        super.setUp()
        
        // Since UI tests are more expensive to run, it's good to exit on failure
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    // MARK: - Tests
    
    func testOnTappingArticleNavigatesToDetailsScreen() {
        //we can use launch arguments for any dynamic routing
        //app.launchArguments = ["-ScreenName", DesignConstants.accessibilityIdentifier]
        
        
        let cell = app.tables.cells.element(boundBy: 0)
        cell.tap()
        
    }
}
