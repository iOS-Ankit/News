//
//  NewsViewModel.swift
//  News
//
//  Created by Ankit on 09/12/20.
//

import Foundation

class NewsViewModel {
    
    func apiTofetchNews(completion : @escaping (NewsList.Result?, String?) -> ()){
        let url = URL(string: "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a8fabd9ff4234c82aad08eaaa4ea17a0")!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                completion(nil, error.localizedDescription)
            } else {
                if let data = data {
                    if let news = try? JSONDecoder().decode(NewsList.Result.self, from: data) {
                        completion(news, nil)
                    }
                } else {
                    completion(nil, "Something went wrong")
                }
            }
        })
        task.resume()
    }
}
