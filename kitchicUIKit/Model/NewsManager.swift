//
//  NewsManager.swift
//  kitchicUIKit
//
//  Created by Marian Nasturica on 15.08.2022.
//

import Foundation

class APICaller {
    static let shared = APICaller()
    
    struct Test {
        
        static let topHeadlinesURL = URL(string: "https://newsapi.org/v2/everything?sortBy=publishedAt&apiKey=ec980cbd0b2a47faabe429dff372c708&q=Apple&language=en")
        static let searchedNews = URL(string: "https://newsapi.org/v2/everything?sortBy=publishedAt&q=\(Values.searchItem)&language=en&apiKey=ec980cbd0b2a47faabe429dff372c708")
        static let healthNews = URL(string: "https://newsapi.org/v2/top-headlines/sources?category=healthapiKey=ec980cbd0b2a47faabe429dff372c708")
        static let techNews = URL(string: "https://newsapi.org/v2/top-headlines/sources?category=technologyapiKey=ec980cbd0b2a47faabe429dff372c708")
        static let sciNews = URL(string: "https://newsapi.org/v2/top-headlines/sources?category=scienceapiKey=ec980cbd0b2a47faabe429dff372c708")
        static let sportNews = URL(string: "https://newsapi.org/v2/top-headlines/sources?category=sportsapiKey=ec980cbd0b2a47faabe429dff372c708")
    }
    
    private init() {}
    
    public func getTopStories(completion: @escaping (Result<[NewsModel], Error>) -> Void) {
        guard let url = Test.topHeadlinesURL else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result  = try JSONDecoder().decode(NewsDataModel.self, from: data)
                    completion(.success(result.articles ?? []))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
    
    public func getHealthNews(completion: @escaping (Result<[NewsModel], Error>) -> Void) {
        guard let url = Test.healthNews else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result  = try JSONDecoder().decode(NewsDataModel.self, from: data)
                    completion(.success(result.articles ?? []))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
    
    public func getTechNews(completion: @escaping (Result<[NewsModel], Error>) -> Void) {
        guard let url = Test.techNews else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result  = try JSONDecoder().decode(NewsDataModel.self, from: data)
                    completion(.success(result.articles ?? []))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
    
    public func getSciNews(completion: @escaping (Result<[NewsModel], Error>) -> Void) {
        guard let url = Test.sciNews else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result  = try JSONDecoder().decode(NewsDataModel.self, from: data)
                    completion(.success(result.articles ?? []))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
    
    public func getSportNews(completion: @escaping (Result<[NewsModel], Error>) -> Void) {
        guard let url = Test.sportNews else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result  = try JSONDecoder().decode(NewsDataModel.self, from: data)
                    completion(.success(result.articles ?? []))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
    
    public func getSearchNews(completion: @escaping (Result<[NewsModel], Error>) -> Void) {
        guard let url = Test.searchedNews else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result  = try JSONDecoder().decode(NewsDataModel.self, from: data)
                    completion(.success(result.articles ?? []))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
    
    
}

class NewsTableCellViewModel {
    let title: String
    let subtitle: String
    let imageURL: URL?
    let source: String?
    var imageData: Data? = nil
    
    init(
        title: String,
        subtitle: String,
        imageURL: URL?,
        source: String
    ) {
        self.title = title
        self.subtitle = subtitle
        self.imageURL = imageURL
        self.source = source
    }
}
