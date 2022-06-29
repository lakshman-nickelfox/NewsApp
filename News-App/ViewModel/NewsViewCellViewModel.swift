//
//  NewsViewCellViewModel.swift
//  News-App
//
//  Created by Sree Lakshman on 28/06/22.
//

import Foundation
class NewsTableViewCellViewModel{
    let title: String
    let subtitle: String
    let imageURL: URL?
    var imageData: Data?
    
    init(title:String, subtitle: String, imageURL:URL?) {
        self.title = title
        self.subtitle = subtitle
        self.imageURL = imageURL
    }
}
