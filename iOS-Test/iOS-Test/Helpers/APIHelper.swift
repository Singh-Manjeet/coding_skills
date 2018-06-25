//
//  APIHelper.swift
//  iOS-Test
//
//  Created by Manjeet Singh on 13/2/18.
//  Copyright © 2018 Manjeet Singh. All rights reserved.
//

import Foundation

class APIHelper {
    // MARK: - Various Helper Methods to parse json data safely
    class func stringValueForKeySafe(_ dict: [String: AnyObject], key: String) -> String {
        if let value = dict[key] as? String {
            return value
        }
        return ""
    }
    
    class func floatValueForKeySafe(_ dict: [String: AnyObject], key: String) -> Float {
        if let value = dict[key] as? Float {
            return value
        }
        return 0.0
    }
    
    class func dateValueForKeySafe(_ dict: [String: AnyObject], key: String) -> Date {
        if let value = dict[key] as? String {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            guard let formattedDate = formatter.date(from: value) else { return Date() }
            return formattedDate
        }
        return Date()
    }
    
    class func integerValueForKeySafe(_ dict: [String: AnyObject], key: String) -> Int {
        if let value = dict[key] as? Int {
            return value
        }
        return 0
    }
    
    class func boolValueForKeySafe(_ dict: [String: AnyObject], key: String) -> Bool {
        if let value = dict[key] as? Bool {
            return value
        }
        return false
    }
    
    class func arrayValueForKeySafe(_ dict: [String: AnyObject], key: String) -> [[String: AnyObject]] {
        if let value = dict[key] as? [[String: AnyObject]] {
            return value
        }
        return [[String: AnyObject]]()
    }
    
    class func dictionaryForKeySafe(_ dict: [String: AnyObject], key: String) -> [String: AnyObject] {
        if let value = dict[key] as? [String: AnyObject] {
            return value
        }
        return [String: AnyObject]()
    }
    
}
