//
//  NewsData.swift
//  kitchicUIKit
//
//  Created by Marian Nasturica on 19.08.2022.
//

import Foundation

// Response Array struct

//struct ArticleList: Decodable {
//
//    let articles: [Articles]
//
//}

// Raw Data struct

//struct Articles: Codable {
//
//    let title: String?
//    let description: String?
//    let url: String?
//    let urlToImage: String?
//    let publishedAt: String?
    
//    enum CodingKeys: CodingKeys {
//        case title: String
//        case description: String
//        case url: String
//        case urlToImage: String
//        case publishedAt: String
//    }
//
//}

// Due to "source" having more options, creating another struct for it to get what its relevant in this case for it

//struct Source: Decodable{
//
//    let name: String
//
//}

    struct NewsDataModel: Codable {
        let articles: [NewsModel]?
    }

    struct NewsModel: Codable {
        let source: Source
        let author: String?
        let title: String?
        let description: String?
        let url: String?
        let urlToImage: String?
//        let publishedAt: Date
        
        struct Source: Codable {
            let id: String?
            let name: String?
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case status
        case totalResults
        case articles
    }
