//
//  MVVMModel.swift
//  StoryBooks
//
//  Created by WEMA on 20/01/2024.
//

import Foundation
import UIKit

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
        do {
            let storyModel = try await networkCall.fetchStories(url: URL(string: "https://api.nytimes.com/svc/topstories/v2/science.json?api-key=KG3MjLoQuGKVvfZr8wgqlGrgV4sWmjBW")!)
            responseHandler?(storyModel)
            print(storyModel)
        }
        catch (let error){
            errorHandler?(error.localizedDescription)
        }
    }
}

