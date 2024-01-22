//
//  DIContainer.swift
//  StoryBooks
//
//  Created by WEMA on 20/01/2024.
//

import Foundation

class DIContainer {
    
    static let shared: DIContainer = DIContainer()
    
    private init() {}
    
    func makeTopStoriesViewModel() -> TopStoriesViewModel{
        TopStoriesViewModel(networkCall: NetworkCall())
    }
    
    func makeBooksViewModel() -> BooksViewModel{
        BooksViewModel(networkCall: NetworkCall())
    }
}
