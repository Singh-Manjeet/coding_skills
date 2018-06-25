//
//  UIImageView+Extension.swift
//  iOS-Test
//
//  Created by Manjeet Singh on 13/2/18.
//  Copyright © 2018 Manjeet Singh. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    /**
     To download image asynchronously
     Parameters:
     Image URL String, Completion Handler
     */
    public func imageFromUrl(urlString: String) {
        let task = URLSession.shared.dataTask(with: getValidatedURL(urlString: urlString)!) { data, response, error in
            guard let data = data, error == nil else { return }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }
        
        task.resume()
    }
}

private extension UIImageView {
    func getValidatedURL (urlString: String) -> URL? {
        
        if let url = NSURL(string: urlString) as URL? {
            
            if UIApplication.shared.canOpenURL(url) {
                return url
            }
        }
        
        return nil
    }
}
