//
//  MVVMModel.swift
//  StoryBooks
//
//  Created by WEMA on 20/01/2024.
//

import Foundation
import UIKit

//let activityLoader = UIActivityIndicatorView(style: .large)

protocol TopStoriesModelDelegate: AnyObject {
    
    func DidReceivedResponse(data: TopStoriesModel?)
    func DidReceiveError(error: String)
}

class TopStoriesViewModel {
    var networkCall: NetworkCall
    
    init(networkCall: NetworkCall) {
        self.networkCall = networkCall
    }
    
    weak var delegate: TopStoriesModelDelegate?
    var responseHandler: ((TopStoriesModel?) -> Void)?
    var errorHandler: ((String?) -> Void)?
    
    func getStories() async {
        //await activityLoader.startAnimating()
        do {
            let storyModel = try await networkCall.fetchStories(url: URL(string: "https://api.nytimes.com/svc/topstories/v2/science.json?api-key=KG3MjLoQuGKVvfZr8wgqlGrgV4sWmjBW")!)
            responseHandler?(storyModel)
            print(storyModel)
        }
        catch (let error){
            errorHandler?(error.localizedDescription)
        }
    }
    
//    func getBooks() async {
//        do {
//            let bookModel = try await networkCall.fetchBooks(url: URL(string: "https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=KG3MjLoQuGKVvfZr8wgqlGrgV4sWmjBW")!)
//            responseHandler?(bookModel)
//            print(bookModel)
//        }
//        catch (let error){
//            errorHandler?(error.localizedDescription)
//        }
//    }
}

