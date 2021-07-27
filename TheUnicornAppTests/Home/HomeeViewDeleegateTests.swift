//
//  HomeeViewDeleegateTests.swift
//  TheUnicornAppTests
//
//  Created by Rahul Goel on 26/07/21.
//

import XCTest

class HomeeViewDeleegateTests: XCTestCase{
    var api:MockHomeAPIManager!
    var delegate:MockHomeViewDelegateImplementation!
    var vm:HomeViewModel!

    override func setUp() {
        super.setUp()
        api = MockHomeAPIManager()
        delegate = MockHomeViewDelegateImplementation()
        vm = HomeViewModel(api)
        vm.delegate = delegate
    }
    
    override func tearDown() {
        super.tearDown()
        api = nil
        delegate = nil
        vm = nil
    }
    
    func testNewsLoadedSuccessfully(){
        //Set API Response
        api.error = nil
        var news = News()
        news.articles = [NewsItem(),NewsItem()] //Added 2 Test Articles
        api.news = news
        
        //Action :
        vm.fetchNews()
        
        //Callbacks :
        delegate.reloadDataCallback = {[weak self] in
            XCTAssert(self?.vm.getTotalLatestNews() == 2, "Item Count should be 2")
        }
        
    }
    
    func testNewsLoadedWithError(){
        //Set API Response
        api.error = NSError()
        var news = News()
        news.articles = [] //Added No Test Articles
        api.news = news
        
        //Action :
        vm.fetchNews()
        
        //Callbacks :
        delegate.reloadDataCallback = {[weak self] in
            XCTAssert(self?.vm.getTotalLatestNews() == 0, "Item Count should be 0")
            XCTAssert(self?.vm.getLatestNews().isEmpty == true, "Item Array should be empty")
        }
    }
    
    func testNewsLoadedSEmpty(){
        
    }
}
