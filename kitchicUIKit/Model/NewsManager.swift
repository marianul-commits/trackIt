//
//  NewsManager.swift
//  kitchicUIKit
//
//  Created by Marian Nasturica on 15.08.2022.
//

import Foundation

//protocol NewsManagerDelegate {
//    func didUpdateWeather(_ newsManager: NewsManager)
//    func didFailWithError(error: Error)
//}

//Creating the call to API
struct NewsManager {
    
    let newsURL = "https://newsapi.org/v2/everything?sortBy=publishedAt&apiKey=ec980cbd0b2a47faabe429dff372c708"
    
//    var delegate: NewsManagerDelegate
    
//Creating a func that allows the user to search
    
    func getNews(searchItem: String) {
        
        let urlString = "\(newsURL)&q=\(searchItem)"
        

        performRequest(urlString: urlString)

    }
    
    func performRequest(urlString: String) {
        
        // Creating the URL
        
        if let url = URL(string: urlString) {
            
        // Creating the URLsession
            
            let session = URLSession(configuration: .default)
            
        // Giving the session a task
            
            let task = session.dataTask(with: url) { (data, response, error) in
                
                //Checking for errors
                
                if error != nil{
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    
                    //Parse the data
                    
                    self.parseJSON(newsData: safeData)
                    
                    
                }
            }
            
        // Starting the task
            
            task.resume()
            
        }
        
    }

    // Parsing the JSON data from the API
    
    func parseJSON(newsData: Data){
        
        // Creating a decoder
        
        let decoder = JSONDecoder()
        
        do{
        
        let decodedData = try decoder.decode(Response.self, from: newsData)
        
            print(decodedData.articles)
            
        } catch {
            print(error)
        }
    }
    
}


