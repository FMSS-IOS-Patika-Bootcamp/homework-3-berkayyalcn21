//
//  PostListViewModel.swift
//  ToDoList
//
//  Created by Berkay on 19.09.2022.
//

import Foundation

protocol PostListViewModelViewProtocol: AnyObject {
    
    func didCellItemFetch(_ items: [PostCellViewModel])
}


class PostListViewModel {
    
    private let model = PostListModel()
    weak var viewDelegate: PostListViewModelViewProtocol?
    
    init() {
        model.delegate = self
    }
    
    func didViewLoad() {
        model.fetchData()
    }
    
    func didClickItem(at index: Int) {
        // Todo:
    }
}


private extension PostListViewModel {
    
    @discardableResult
    func makeViewBasedModel() -> [PostCellViewModel] {
        return []
    }
}

// MARK: - PostListModelViewModelProtocol
extension PostListViewModel: PostListModelViewModelProtocol {
    
    func didDataFetch() {
        // Todo:
        
        viewDelegate?.didCellItemFetch(makeViewBasedModel())
        makeViewBasedModel()
    }
}
