//
//  Article.swift
//  News-App
//
//  Created by Sree Lakshman on 28/06/22.
//

import Foundation

struct Article: Codable {
    let source: Source
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
}

struct Source: Codable {
    let name: String?
}
