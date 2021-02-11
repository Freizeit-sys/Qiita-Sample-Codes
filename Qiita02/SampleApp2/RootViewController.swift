//
//  RootViewController.swift
//  SampleApp2
//
//  Created by Admin on 2021/02/09.
//

import UIKit

class RootViewController: UICollectionViewController {
    
    private let padding: CGFloat = 16.0
    private let cellId = "cellId"
    private let headerId = "headerId"
    
    private var header: HeaderView?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let array = ["A","B","C","D","E"]
        let array2 = array.dropFirst()
        
        for (i, value) in zip(array2.indices, array2) {
            print(i, array2[i])
        }
        
        for (i, value) in array2.enumerated() {
            print(i, array2[i])
        }
        
        self.setupCollectionViewLayout()
        self.setupCollectionView()
    }
    
    private func setupCollectionViewLayout() {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        }
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .systemBackground
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .green
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId, for: indexPath) as? HeaderView
        return header!
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        
        if contentOffsetY > 0 {
            header?.animator.fractionComplete = 0
        }
    }
}

extension RootViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 2 * padding, height: 56)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height / 3)
    }
}

class HeaderView: UICollectionReusableView {
    
    var animator: UIViewPropertyAnimator!
    
    private let imageView: UIImageView = {
        let image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        let iv = UIImageView(image: image)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .systemRed
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: self.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

