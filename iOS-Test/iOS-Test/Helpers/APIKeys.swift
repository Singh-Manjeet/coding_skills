//
//  APIKeys.swift
//  iOS-Test
//
//  Created by Manjeet Singh on 13/2/18.
//  Copyright © 2018 Manjeet Singh. All rights reserved.
//

import Foundation

/**
 * API Constants
 */

struct APIConstants {
    static let baseURL = "https://bruce-v2-mob.fairfaxmedia.com.au/1/coding_test/13ZZQX/full"
}

class APIKeys {
    static let Articles = "assets"
    
    struct Article {
        static let title = "headline"
        static let description = "theAbstract"
        static let author = "byLine"
        static let imageURLs = "relatedImages"
        static let detailURL = "url"
        static let timeStamp = "timeStamp"
    }
}
