//
//  Constants.swift
//  kitchicUIKit
//
//  Created by Marian Nasturica on 15.03.2023.
//

import Foundation


struct K {
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "NewsCell"
    static let apiKey = "apiKey=ec980cbd0b2a47faabe429dff372c708"
}

struct Values {
    static var searchItem: String = ""
    static let healthNews =  "https://newsapi.org/v2/top-headlines/sources?category=health&\(K.apiKey)&language=en"
    static let techNews =  "https://newsapi.org/v2/top-headlines/sources?category=technology&\(K.apiKey)&language=en"
    static let sciNews =  "https://newsapi.org/v2/top-headlines/sources?category=science&\(K.apiKey)&language=en"
    static let sportNews =  "https://newsapi.org/v2/top-headlines/sources?category=sports&\(K.apiKey)&language=en"
}