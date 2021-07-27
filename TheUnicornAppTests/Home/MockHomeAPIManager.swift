//
//  MockHomeAPIManager.swift
//  TheUnicornAppTests
//
//  Created by Rahul Goel on 26/07/21.
//

import Foundation

class MockHomeAPIManager:NewsServices {
    
    var news: News?
    var error: Error?
    
    func fetchNews(_ completion: @escaping (News, Error?) -> Void) {
        DispatchQueue.main.async {[weak self] in
            if let news = self?.news{
                completion(news, nil)
            }else{
                completion(News(), self?.error)
            }
        }
    }
}
