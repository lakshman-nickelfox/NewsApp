//
//  APICaller.swift
//  News-App
//
//  Created by Sree Lakshman on 28/06/22.
//

import Foundation

class APICaller {
    static let shared = APICaller()
    
    
 //Constants
    struct Constants {
    static let topHeadLinesURL = URL(string:
     "https://newsapi.org/v2/top-headlines?country=in&apiKey=e7855adfcfbb4dd69e3fd27172d1aa4e")
    static let searchUrlString =
    "https://newsapi.org/v2/everything?sortBy=popularity&apiKey=e7855adfcfbb4dd69e3fd27172d1aa4e&q="
    }
   

    private init() {}
    
    
    //Networking throug URLSession
    public func getTopStories(completion: @escaping (Result<[Article], Error>) -> Void ){
        guard let url = Constants.topHeadLinesURL else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do{
                    let result = try JSONDecoder().decode(Model.self, from: data)
                    
                    
                    completion(.success(result.articles))
                }
                catch {
                    completion(.failure(error))
                }
            }
            
        }
        task.resume()
        
    }
    
    //Networking through URLSession for Search Functionality
    public func search(with query : String, completion: @escaping (Result<[Article], Error>) -> Void ){
        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        let urlString = Constants.searchUrlString + query
        guard let url = URL(string: urlString) else{
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do{
                    let result = try JSONDecoder().decode(Model.self, from: data)

                    completion(.success(result.articles))
                }
                catch {
                    completion(.failure(error))
                }
            }

        }
        task.resume()

    }
    
}

