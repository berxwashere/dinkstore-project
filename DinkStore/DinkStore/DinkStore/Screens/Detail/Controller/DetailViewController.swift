//
//  DetailViewController.swift
//  DinkStore
//
//  Created by HS on 6.11.2022.
//

import UIKit

final class DetailViewController: UIViewController {
    
    var fakestore: FakeStore? {
        didSet {
            title = fakestore?.title
            detailView.imageView.downloadImage(from: fakestore?.image)
            detailView.price = fakestore?.price
            detailView.category = fakestore?.category
            
        }
    }
    
    private let detailView = DetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailView
    }
}

