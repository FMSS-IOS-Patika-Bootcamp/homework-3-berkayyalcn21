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


extension GalleryVM: GalleryModelToViewModelProtocol {
    
    func didDataFetchProccesFinish(_ isSuccess: Bool) {
        
    }
}
