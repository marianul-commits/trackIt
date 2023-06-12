//
//  ArticleModel.swift
//  kitchicUIKit
//
//  Created by Marian Nasturica on 03.06.2023.
//

import Foundation

protocol ArticleModernProtocol {
    
    func articleRetrived(_ article:[Article])
}

class ArticleModel {
    
    var delegate:ArticleModernProtocol?
    
    //MARK: -- getArticles
    
    func getArticles(){
        
        // Fire off the request to the API
        
        // Create a string URL
        let stringUrl = "https://newsapi.org/v2/top-headlines?country=us&\(K.apiKey)"
        
        // Create a URL object
        let url = URL(string: stringUrl)
        
        // Check that it isn't a nil
        guard url != nil else {
            print("Coudn't create url object")
            return
        }
        
        // Get the URL Session
        let session = URLSession.shared
        
        // Create the data task
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            // Check that there are no errors and that there is data
            if error == nil && data != nil {
                
                // Attempt to parse the JSON
                let decoder = JSONDecoder()
                
                do{
                    
                    // Parse the json into ArticleService
                    let articleService = try decoder.decode(ArticleService.self, from: data!)
                    
                    // Get the articles
                    let articles = articleService.articles!
                    
                    // Pass it back to the view controller in the main thread
                    DispatchQueue.main.async {
                        self.delegate?.articleRetrived(articles)
                    }
                    
                }
                catch{
                    
                    print("error parsing the json")
                    
                } // End Do - Catch
                
            } // End if
            
        } // End Data Task
        
        // Start the data task
        dataTask.resume()
    }
    
    //MARK: -- getSearch
    func getSearch(){
        
        // Fire off the request to the API
        
        // Create a string URL with search value
        let stringUrl = "https://newsapi.org/v2/everything?sortBy=publishedAt&q=\(Values.searchItem)&language=en&\(K.apiKey)"
        
        // Create a URL object
        let url = URL(string: stringUrl)
        
        // Check that it isn't a nil
        guard url != nil else {
            print("Coudn't create url object")
            return
        }
        
        // Get the URL Session
        let session = URLSession.shared
        
        // Create the data task
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            // Check that there are no errors and that there is data
            if error == nil && data != nil {
                
                // Attempt to parse the JSON
                let decoder = JSONDecoder()
                
                do{
                    
                    // Parse the json into ArticleService
                    let articleService = try decoder.decode(ArticleService.self, from: data!)
                    
                    // Get the articles
                    let articles = articleService.articles!
                    
                    // Pass it back to the view controller in the main thread
                    DispatchQueue.main.async {
                        self.delegate?.articleRetrived(articles)
                    }
                    
                }
                catch{
                    
                    print("error parsing the json")
                    
                } // End Do - Catch
                
            } // End if
            
        } // End Data Task
        
        
        // Start the data task
        dataTask.resume()
    }
    
    //MARK: -- getScience
    func getScience(){
        
        // Fire off the request to the API
        
        // Create a string URL
        let stringUrl = Values.sciNews
        
        // Create a URL object
        let url = URL(string: stringUrl)
        
        // Check that it isn't a nil
        guard url != nil else {
            print("Coudn't create url object")
            return
        }
        
        // Get the URL Session
        let session = URLSession.shared
        
        // Create the data task
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            // Check that there are no errors and that there is data
            if error == nil && data != nil {
                
                // Attempt to parse the JSON
                let decoder = JSONDecoder()
                
                do{
                    
                    // Parse the json into ArticleService
                    let articleService = try decoder.decode(ArticleService.self, from: data!)
                    
                    // Get the articles
                    let articlesSci = articleService.articles!
                    
                    // Pass it back to the view controller in the main thread
                    DispatchQueue.main.async {
                        self.delegate?.articleRetrived(articlesSci)
                    }
                    
                }
                catch{
                    
                    print("error parsing the json")
                    
                } // End Do - Catch
                
            } // End if
            
        } // End Data Task
        
        
        // Start the data task
        dataTask.resume()
        
    }
    
    //MARK: -- getHealth
    func getHealth(){
        
        // Fire off the request to the API
        
        // Create a string URL
        let stringUrl = Values.healthNews
        
        // Create a URL object
        let url = URL(string: stringUrl)
        
        // Check that it isn't a nil
        guard url != nil else {
            print("Coudn't create url object")
            return
        }
        
        // Get the URL Session
        let session = URLSession.shared
        
        // Create the data task
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            // Check that there are no errors and that there is data
            if error == nil && data != nil {
                
                // Attempt to parse the JSON
                let decoder = JSONDecoder()
                
                do{
                    
                    // Parse the json into ArticleService
                    let articleService = try decoder.decode(ArticleService.self, from: data!)
                    
                    // Get the articles
                    let articlesHp = articleService.articles!
                    
                    // Pass it back to the view controller in the main thread
                    DispatchQueue.main.async {
                        self.delegate?.articleRetrived(articlesHp)
                    }
                    
                }
                catch{
                    
                    print("error parsing the json")
                    
                } // End Do - Catch
                
            } // End if
            
        } // End Data Task
        
        
        // Start the data task
        dataTask.resume()
        
    }
    
    //MARK: -- getTech
    func getTech(){
        
        // Fire off the request to the API
        
        // Create a string URL
        let stringUrl = Values.techNews
        
        // Create a URL object
        let url = URL(string: stringUrl)
        
        // Check that it isn't a nil
        guard url != nil else {
            print("Coudn't create url object")
            return
        }
        
        // Get the URL Session
        let session = URLSession.shared
        
        // Create the data task
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            // Check that there are no errors and that there is data
            if error == nil && data != nil {
                
                // Attempt to parse the JSON
                let decoder = JSONDecoder()
                
                do{
                    
                    // Parse the json into ArticleService
                    let articleService = try decoder.decode(ArticleService.self, from: data!)
                    
                    // Get the articles
                    let articlesTech = articleService.articles!
                    
                    // Pass it back to the view controller in the main thread
                    DispatchQueue.main.async {
                        self.delegate?.articleRetrived(articlesTech)
                    }
                    
                }
                catch{
                    
                    print("error parsing the json")
                    
                } // End Do - Catch
                
            } // End if
            
        } // End Data Task
        
        
        // Start the data task
        dataTask.resume()
        
        
    }
    
    //MARK: -- getSport
    func getSport(){
        
        // Fire off the request to the API
        
        // Create a string URL
        let stringUrl = Values.sportNews
        
        // Create a URL object
        let url = URL(string: stringUrl)
        
        // Check that it isn't a nil
        guard url != nil else {
            print("Coudn't create url object")
            return
        }
        
        // Get the URL Session
        let session = URLSession.shared
        
        // Create the data task
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            // Check that there are no errors and that there is data
            if error == nil && data != nil {
                
                // Attempt to parse the JSON
                let decoder = JSONDecoder()
                
                do{
                    
                    // Parse the json into ArticleService
                    let articleService = try decoder.decode(ArticleService.self, from: data!)
                    
                    // Get the articles
                    let articlesSport = articleService.articles!
                    
                    // Pass it back to the view controller in the main thread
                    DispatchQueue.main.async {
                        self.delegate?.articleRetrived(articlesSport)
                    }
                    
                }
                catch{
                    
                    print("error parsing the json")
                    
                } // End Do - Catch
                
            } // End if
            
        } // End Data Task
        
        
        // Start the data task
        dataTask.resume()
        
        
    }
    
    //MARK: -- getBusiness
    func getBusiness(){
        
        // Fire off the request to the API
        
        // Create a string URL
        let stringUrl = Values.businessNews
        
        // Create a URL object
        let url = URL(string: stringUrl)
        
        // Check that it isn't a nil
        guard url != nil else {
            print("Coudn't create url object")
            return
        }
        
        // Get the URL Session
        let session = URLSession.shared
        
        // Create the data task
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            // Check that there are no errors and that there is data
            if error == nil && data != nil {
                
                // Attempt to parse the JSON
                let decoder = JSONDecoder()
                
                do{
                    
                    // Parse the json into ArticleService
                    let articleService = try decoder.decode(ArticleService.self, from: data!)
                    
                    // Get the articles
                    let articlesSci = articleService.articles!
                    
                    // Pass it back to the view controller in the main thread
                    DispatchQueue.main.async {
                        self.delegate?.articleRetrived(articlesSci)
                    }
                    
                }
                catch{
                    
                    print("error parsing the json")
                    
                } // End Do - Catch
                
            } // End if
            
        } // End Data Task
        
        
        // Start the data task
        dataTask.resume()
        
    }
    
    //MARK: -- getGeneral
    func getGeneral(){
        
        // Fire off the request to the API
        
        // Create a string URL
        let stringUrl = Values.generalNews
        
        // Create a URL object
        let url = URL(string: stringUrl)
        
        // Check that it isn't a nil
        guard url != nil else {
            print("Coudn't create url object")
            return
        }
        
        // Get the URL Session
        let session = URLSession.shared
        
        // Create the data task
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            // Check that there are no errors and that there is data
            if error == nil && data != nil {
                
                // Attempt to parse the JSON
                let decoder = JSONDecoder()
                
                do{
                    
                    // Parse the json into ArticleService
                    let articleService = try decoder.decode(ArticleService.self, from: data!)
                    
                    // Get the articles
                    let articlesSci = articleService.articles!
                    
                    // Pass it back to the view controller in the main thread
                    DispatchQueue.main.async {
                        self.delegate?.articleRetrived(articlesSci)
                    }
                    
                }
                catch{
                    
                    print("error parsing the json")
                    
                } // End Do - Catch
                
            } // End if
            
        } // End Data Task
        
        
        // Start the data task
        dataTask.resume()
        
    }
    
    //MARK: -- getEntertainment
    func getEntertainment(){
        
        // Fire off the request to the API
        
        // Create a string URL
        let stringUrl = Values.showNews
        
        // Create a URL object
        let url = URL(string: stringUrl)
        
        // Check that it isn't a nil
        guard url != nil else {
            print("Coudn't create url object")
            return
        }
        
        // Get the URL Session
        let session = URLSession.shared
        
        // Create the data task
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            // Check that there are no errors and that there is data
            if error == nil && data != nil {
                
                // Attempt to parse the JSON
                let decoder = JSONDecoder()
                
                do{
                    
                    // Parse the json into ArticleService
                    let articleService = try decoder.decode(ArticleService.self, from: data!)
                    
                    // Get the articles
                    let articlesSci = articleService.articles!
                    
                    // Pass it back to the view controller in the main thread
                    DispatchQueue.main.async {
                        self.delegate?.articleRetrived(articlesSci)
                    }
                    
                }
                catch{
                    
                    print("error parsing the json")
                    
                } // End Do - Catch
                
            } // End if
            
        } // End Data Task
        
        
        // Start the data task
        dataTask.resume()
        
    }
    
}
