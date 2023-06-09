//
//  Article.swift
//  kitchicUIKit
//
//  Created by Marian Nasturica on 03.06.2023.
//

import Foundation

struct Article: Decodable {
    
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var source: Source
    
    struct Source: Codable {
        let id: String?
        let name: String?
    }
}

struct ArticleService: Decodable {
    
    var totalResults:Int?
    var articles: [Article]?
    
}
