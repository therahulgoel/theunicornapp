//
//  NewsItem.swift
//  TheUnicornApp
//
//  Created by Rahul Goel on 26/07/21.
//

import Foundation

struct NewsItem:Decodable{
    var author:String?
    var title:String?
    var url:String?
    
}

struct News:Decodable{
    var articles:[NewsItem]?
}
