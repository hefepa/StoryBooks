//
//  MVVMModel.swift
//  StoryBooks
//
//  Created by WEMA on 20/01/2024.
//

import Foundation
import UIKit

//let activityLoader = UIActivityIndicatorView(style: .large)

protocol BooksModelDelegate: AnyObject {
    
    func DidReceivedResponse(data: BookModel?)
    func DidReceiveError(error: String)
}

class BooksViewModel {
    var networkCall: NetworkCall
    
    init(networkCall: NetworkCall) {
        self.networkCall = networkCall
    }
    
    weak var bookDelegate: BooksModelDelegate?
    var responseHandler: ((BookModel?) -> Void)?
    var errorHandler: ((String?) -> Void)?
    
    func getBooks() async {
        //await activityLoader.startAnimating()
        do {
            let bookModel = try await networkCall.fetchBooks(url: URL(string: "https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=KG3MjLoQuGKVvfZr8wgqlGrgV4sWmjBW")!)
            responseHandler?(bookModel)
            //print(bookModel)
        }
        catch (let error){
            errorHandler?(error.localizedDescription)
        }
    }
}

