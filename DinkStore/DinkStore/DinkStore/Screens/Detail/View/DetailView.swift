//
//  DetailView.swift
//  DinkStore
//
//  Created by HS on 6.11.2022.
//

import UIKit

final class DetailView: UIView {
  
    var title: String? {
        didSet {
            titleKeyLabel.text = "Title:"
            titleKeyLabel.font = .boldSystemFont(ofSize: 17.0)
            titleLabel.text = title ?? "-"
        }
    }
    
    var price: String? {
        didSet {
            priceKeyLabel.text = "Price:"
            priceKeyLabel.font = .boldSystemFont(ofSize: 17.0)
            priceLabel.text = price ?? "-"
        }
    }
    
    var category: String? {
        didSet {
            categoryKeyLabel.text = "Category:"
            categoryKeyLabel.font = .boldSystemFont(ofSize: 17.0)
            categoryLabel.text = category ?? "-"
        }
    }
    
    private(set) var imageView = UIImageView()
    
    
    private var titleKeyLabel = UILabel()
    private var titleLabel = UILabel()
    private lazy var titleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleKeyLabel, UIView(), titleLabel])
        stackView.axis = .horizontal
        return stackView
    }()
    
    private var priceKeyLabel = UILabel()
    private var priceLabel = UILabel()
    private lazy var priceStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [priceKeyLabel, UIView(), priceLabel])
        stackView.axis = .horizontal
        return stackView
    }()
    
    private var categoryKeyLabel = UILabel()
    private var categoryLabel = UILabel()
    private lazy var categoryStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [categoryKeyLabel, UIView(), categoryLabel])
        stackView.axis = .horizontal
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
    //    releaseDateLabel.numberOfLines = .zero
        titleLabel.numberOfLines = .zero
        priceLabel.numberOfLines = .zero
        categoryLabel.numberOfLines = .zero
        
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: .screenWidth)
        ])
        
        let stackView = UIStackView(arrangedSubviews: [titleStackView, priceStackView, categoryStackView])
        stackView.axis = .vertical
        stackView.spacing = 8.0
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0),
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32.0),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16.0)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
