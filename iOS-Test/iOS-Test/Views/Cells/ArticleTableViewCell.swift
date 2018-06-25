//
//  ArticleTableViewCell.swift
//  iOS-Test
//
//  Created by Manjeet Singh on 13/2/18.
//  Copyright © 2018 Manjeet Singh. All rights reserved.
//

import Foundation
import UIKit

struct CellDesign {
    static let cellIdentifier: String = "ArticleTableViewCellIdentifier"
}

class ArticleTableViewCell: UITableViewCell {
    // MARK: - Outlets
    
    @IBOutlet fileprivate weak var articleImageView: UIImageView!
    @IBOutlet fileprivate weak var articleTitleLabel: UILabel!
    @IBOutlet fileprivate weak var articleDescriptionLabel: UILabel!
    @IBOutlet fileprivate weak var articleAuthorLabel: UILabel!
    
    @IBOutlet fileprivate weak var articleView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        formatLabels()
    }
    
    /**
     * To populate the cell with article view model
     * Parameters: articleViewModel
     */
    func populate(withArticle article: ArticleViewModel) {
        
        articleTitleLabel.text = article.title
        articleAuthorLabel.text = String(format: "Published by %@", article.author)
        articleDescriptionLabel.text = article.description
        
        if let articleImageURL = article.imageURLString {
            articleImageView.imageFromUrl(urlString: articleImageURL)
        }
    }
}

// MARK: - Private Helpers
fileprivate extension ArticleTableViewCell {
    func formatLabels() {
        for label in [articleAuthorLabel, articleDescriptionLabel] as [UILabel] {
            label.textColor = .orange
            label.font = UIFont(name: "Helvetica", size: 16.0)
        }
        
        for label in [articleTitleLabel] as [UILabel] {
            label.textColor = .orange
            label.font = UIFont(name: "Helvetica", size: 24.0)
        }
    }
}
