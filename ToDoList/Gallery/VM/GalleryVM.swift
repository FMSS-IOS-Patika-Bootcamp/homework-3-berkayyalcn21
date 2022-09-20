//
//  ViewModel.swift
//  ToDoList
//
//  Created by Berkay on 20.09.2022.
//

import Foundation

protocol GallertyVMToViewProtocol: AnyObject {
    
    func didCellItemFetch(_ items: [PhotoCellViewModel])
}

class GalleryVM{
    
    private let model = GalleryModel()
    weak var viewDelegate: GallertyVMToViewProtocol?
    
    init() {
        model.delegate = self
    }
    
    func didViewLoad() {
        model.fetchData()
    }
}

private extension GalleryVM {
    
    @discardableResult
    func makeViewBasedModel(_ photos: [Photos]) -> [PhotoCellViewModel] {
        return photos.map { .init(url: $0.url)}
    }
}

extension GalleryVM: GalleryModelToViewModelProtocol {
    
    func didDataFetchProccesFinish(_ isSuccess: Bool) {
        
        if isSuccess {
            let photos = model.photos.filter { $0.id < 101 }
            let cellModels = makeViewBasedModel(photos)
            viewDelegate?.didCellItemFetch(cellModels)
        }
    }
}
