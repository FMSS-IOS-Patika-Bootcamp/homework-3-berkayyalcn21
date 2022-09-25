//
//  Model.swift
//  ToDoList
//
//  Created by Berkay on 20.09.2022.
//

import Foundation

protocol GalleryModelToViewModelProtocol: AnyObject {
    
    func didDataFetchProccesFinish(_ isSuccess: Bool)
}

// Database settings
class GalleryModel {
    
    weak var delegate: GalleryModelToViewModelProtocol?
    var photos: [Photos] = []
    
    // get data
    func fetchData() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {
            delegate?.didDataFetchProccesFinish(false)
            return
        }
        
        var request: URLRequest = .init(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            guard let self = self else { return }
            
            guard error == nil else {
                self.delegate?.didDataFetchProccesFinish(false)
                return
            }
            
            let statusCode = (response as! HTTPURLResponse).statusCode
            
            guard
                statusCode >= 200,
                statusCode < 300 else {
                self.delegate?.didDataFetchProccesFinish(false)
                return
            }
            
            guard let data = data else {
                self.delegate?.didDataFetchProccesFinish(false)
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                self.photos = try jsonDecoder.decode([Photos].self, from: data)
                self.delegate?.didDataFetchProccesFinish(true)
            }catch {
                self.delegate?.didDataFetchProccesFinish(false)
            }
        }
        task.resume()
    }
}
