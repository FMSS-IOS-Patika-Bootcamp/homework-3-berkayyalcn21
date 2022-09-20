//
//  ViewController.swift
//  ToDoList
//
//  Created by Berkay on 20.09.2022.
//

import UIKit
import Kingfisher

class GalleryVC: UIViewController {

    @IBOutlet weak var galleryCollectionView: UICollectionView!
    private let galleryIdentifier = "GalleryCollectionView"
    private var listTypeNumber: CGFloat = 4
    private let viewModel = GalleryVM()
    private var items: [PhotoCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        viewModel.viewDelegate = self
        viewModel.didViewLoad()
    }
    
    func setupUI() {
        galleryCollectionView.delegate = self
        galleryCollectionView.dataSource = self
        register()
    }
    
    func register() {
        galleryCollectionView.register(.init(nibName: galleryIdentifier, bundle: nil), forCellWithReuseIdentifier: galleryIdentifier)
    }
    
    @IBAction func listTypeButtonTapped(_ sender: Any) {
        if listTypeNumber != 4 {
            listTypeNumber += 1
            galleryCollectionView.reloadData()
        }else {
            listTypeNumber = 2
            galleryCollectionView.reloadData()
        }
    }
}

extension GalleryVC: GallertyVMToViewProtocol {
    
    func didCellItemFetch(_ items: [PhotoCellViewModel]) {
        self.items = items
        DispatchQueue.main.async {
            self.galleryCollectionView.reloadData()
        }
    }
}

extension GalleryVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: galleryIdentifier, for: indexPath) as! GalleryCollectionView
        if let url = items[indexPath.row].url {
            let myUrl = URL(string: url)
            cell.imageView.kf.setImage(with: myUrl)
        }
        return cell
    }
}

extension GalleryVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: (collectionView.frame.width - 50) / listTypeNumber, height: 150)
    }
}
