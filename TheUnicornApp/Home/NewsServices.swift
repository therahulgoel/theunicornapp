//
//  NewsService.swift
//  TheUnicornApp
//
//  Created by Rahul Goel on 26/07/21.
//

import Foundation

protocol NewsServices{
    func fetchNews(_ completion:@escaping (News, Error?)->Void)
}

