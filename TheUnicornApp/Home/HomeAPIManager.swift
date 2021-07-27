//
//  HomeAPIManager.swift
//  TheUnicornApp
//
//  Created by Rahul Goel on 26/07/21.
//

import Foundation

final class HomeAPIManager:NewsServices{
    func fetchNews(_ completion: @escaping (News, Error?) -> Void) {
        let session = URLSession.shared
        var req = URLRequest(url: URL(string: API.topHeadLinesUrl())!)
        req.httpMethod = "GET"
        let task = session.dataTask(with: req) { (data, res, error) in
            if let data = data{
                let jsonDecoder = JSONDecoder()
                if let decodedResponse = try? jsonDecoder.decode(News.self,
                                                                 from: data){
                    DispatchQueue.main.async {
                        completion(decodedResponse,nil)
                    }
                }
            }
        }
        task.resume()
    }
}
