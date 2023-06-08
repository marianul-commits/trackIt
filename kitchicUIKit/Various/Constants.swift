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
}

struct Values {
    static var searchItem: String = ""
    static let healthNews =  "https://newsapi.org/v2/top-headlines/sources?category=healthapiKey=ec980cbd0b2a47faabe429dff372c708&language=en"
    static let techNews =  "https://newsapi.org/v2/top-headlines/sources?category=technologyapiKey=ec980cbd0b2a47faabe429dff372c708&language=en"
    static let sciNews =  "https://newsapi.org/v2/top-headlines/sources?category=scienceapiKey=ec980cbd0b2a47faabe429dff372c708&language=en"
    static let sportNews =  "https://newsapi.org/v2/top-headlines/sources?category=sportsapiKey=ec980cbd0b2a47faabe429dff372c708&language=en"
}
