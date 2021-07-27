//
//  MockHomeViewDelegate.swift
//  TheUnicornAppTests
//
//  Created by Rahul Goel on 26/07/21.
//

import Foundation

class MockHomeViewDelegateImplementation:HomeViewModelDelegate {
    var reloadDataCallback:(()-> Void)?
    
    func reloadData(){
        reloadDataCallback?()
    }
}
