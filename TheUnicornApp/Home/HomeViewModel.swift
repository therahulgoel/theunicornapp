//
//  HomeViewModel.swift
//  TheUnicornApp
//
//  Created by Rahul Goel on 26/07/21.
//

import Foundation

final class HomeViewModel{
    
    weak var delegate:HomeViewModelDelegate?
    var api:NewsServices
    private var latestNews:[NewsItem] = [NewsItem]()
    
    init(_ api:NewsServices) {
        self.api = api
    }
    
    func getTotalLatestNews()->Int{
        return latestNews.count
    }
    
    func getLatestNews()->[NewsItem]{
        return latestNews
    }
}

extension HomeViewModel{
    func fetchNews(){
        api.fetchNews { [weak self](news, error) in
            if error == nil{
                self?.latestNews = news.articles!
            }
            self?.delegate?.reloadData()
        }
    }
}
