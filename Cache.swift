//
//  Cache.swift
//  kitchicUIKit
//
//  Created by Marian Nasturica on 03.06.2023.
//

import Foundation

class CacheManager {
    
    static var imageDictionary = [String:Data]()
    
    static func saveData(_ url:String, _ imageData:Data){
        
        // Save the image data along with the URL
        imageDictionary[url] = imageData
        
    }
    
    static func retrievedData(_ url:String) -> Data?{
        
        // Return the saved image data or nil
        return imageDictionary[url]
        
    }
    
}
