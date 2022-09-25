//
//  PostListViewModel.swift
//  ToDoList
//
//  Created by Berkay on 19.09.2022.
//

import Foundation

protocol PostListViewModelViewProtocol: AnyObject {
    
    func didCellItemFetch(_ items: [PostCellViewModel])
    func showEmptyView()
    func hideEmptyView()
}


class PostListViewModel {
    
    private let model = PostListModel()
    weak var viewDelegate: PostListViewModelViewProtocol?
    
    init() {
        model.delegate = self
    }
    
    // Get data
    func didViewLoad() {
        model.fetchData()
    }
    
    func didClickItem(at index: Int) {
        let selectedItem = model.posts[index]
        // TODO: NAVIGATE
    }
}


private extension PostListViewModel {
    
    // Model transform
    @discardableResult
    func makeViewBasedModel(_ posts: [Post]) -> [PostCellViewModel] {
        return posts.map { .init(title: $0.title, desc: $0.body)}
    }
}

// MARK: - PostListModelViewModelProtocol
extension PostListViewModel: PostListModelViewModelProtocol {
    
    func didDataFetchProcessFinish(_ isSuccess: Bool) {
        
        if isSuccess {
            let posts = model.posts
            let cellModels = makeViewBasedModel(posts)
            viewDelegate?.didCellItemFetch(cellModels)
            viewDelegate?.hideEmptyView()
        }else {
            viewDelegate?.showEmptyView()
        }
    }
}
