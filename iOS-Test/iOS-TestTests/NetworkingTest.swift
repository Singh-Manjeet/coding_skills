//
//  NetworkingTest.swift
//  iOS-TestTests
//
//  Created by Manjeet Singh on 13/2/18.
//  Copyright © 2018 Manjeet Singh. All rights reserved.
//

import XCTest
@testable import iOS_Test

/**
 * To test if the networking works appropriately
 * - All test cases can be extended further, but can spend more time, its already 2.30am  :-)
 */

class NetworkingTest: XCTestCase {
    
    func testCalback() {
        let networking = Networking()
        
        // 1. Setup the expectation
        let expectation = XCTestExpectation(description: "Networking fetches data and succeeds")
        
        // 2. Exercise and verify the behaviour as usual
        networking.getArticles(url: URL(string: APIConstants.baseURL)!, callback: { arrayOfArticles in
            
            XCTAssert(!arrayOfArticles.isEmpty)
            expectation.fulfill()
        })
        
    }
    
    func testURLConnection() {
        let url = URL(string: APIConstants.baseURL)!
        let urlExpectation = expectation(description: "GET \(url)")
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            
            XCTAssertNotNil(data, "data should not be nil")
            XCTAssertNil(error, "error should be nil")
            
            if let response = response as? HTTPURLResponse,
                let responseURL = response.url,
                let mimeType = response.mimeType
            {
              
                XCTAssertEqual(responseURL.absoluteString, url.absoluteString, APIConstants.baseURL)
                XCTAssertEqual(response.statusCode, 200, "Response status code should be 200")
                XCTAssertEqual(mimeType, "application/json", "Response content type should be json/html")
            
            } else {
                XCTFail("Response was not NSHTTPURLResponse")
            }
            
            urlExpectation.fulfill()
        }
        
        task.resume()
        
        waitForExpectations(timeout: task.originalRequest!.timeoutInterval) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            task.cancel()
        }
    }
}
