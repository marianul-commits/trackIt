//
//  NewsData.swift
//  kitchicUIKit
//
//  Created by Marian Nasturica on 19.08.2022.
//

import Foundation

// Response Array struct

struct Response: Decodable {
    
    let articles: [Article]
    
}

// Raw Data struct

struct Article: Decodable {
    
    let source: Source?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    
}

// Due to "source" having more options, creating another struct for it to get what its relevant in this case for it

struct Source: Decodable{

    let name: String

}
