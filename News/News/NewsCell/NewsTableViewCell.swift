//
//  NewsTableViewCell.swift
//  News
//
//  Created by Ankit on 09/12/20.
//

import UIKit
import Kingfisher

class NewsTableViewCell: UITableViewCell {
    
    //MARK: Cell Interface Builder Outlets
    
    @IBOutlet weak var newsThumbnail: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var authorLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    // MARK: Set Cell Data
    
    func setCellData(newsInfo: NewsList.Article) {
        titleLbl.text = newsInfo.title
        authorLbl.text = newsInfo.author
        descriptionLbl.text = newsInfo.description
        let url = URL(string: newsInfo.urlToImage ?? "")
        newsThumbnail.kf.setImage(with: url)
    }
}
