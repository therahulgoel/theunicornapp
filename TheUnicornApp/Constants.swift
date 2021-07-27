//
//  Constants.swift
//  TheUnicornApp
//
//  Created by Rahul Goel on 26/07/21.
//

import Foundation

enum API{
    static let url = "https://newsapi.org/v2/top-headlines?country=in"
    static let apiKey = "5fe00ada48c14b9dae111dc440e8ebbd"
    
    static func topHeadLinesUrl()->String{
        return "\(url)&apiKey=\(apiKey)"
    }
}
