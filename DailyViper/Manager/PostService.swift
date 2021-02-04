//
//  PostService.swift
//  DailyViper
//
//  Created by Ferrakkem Bhuiyan on 2021-02-03.
//

import Foundation

struct EndPoints {
    static let url = "https://jsonplaceholder.typicode.com/posts?userId=1"
}

class PostService{
    private var dataTask: URLSessionDataTask?
    
    func getPosts(completion: @escaping(Result<[Post], Error>) ->Void){
        let baseUrl = EndPoints.url
        print("v4")
        guard let url = URL(string: baseUrl) else {
            return
        }
        
        print("URL****** \(url)")
        
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Handle Error
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                // Handle Empty Response
                print("Empty Response")
                return
            }
            print("Now Response status code: \(response.statusCode)")
            
            guard let data = data else {
                // Handle Empty Data
                print("Empty Data")
                return
            }
            
            do {
                // Parse the data
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Post].self, from: data)
                //print(jsonData)
                // Back to the main thread
                DispatchQueue.main.async {
                    //print("error***")
                    completion(.success(jsonData))
                }
            } catch let error {
                print("##error")
                completion(.failure(error))
            }
            
        }
        dataTask?.resume()
    }
}
