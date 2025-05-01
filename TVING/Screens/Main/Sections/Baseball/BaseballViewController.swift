//
//  BaseballViewController.swift
//  TVING
//
//  Created by 선영주 on 5/1/25.
//
import UIKit

class BaseballViewController: UIViewController {

    private let baseballItems: [BaseballModel] = BaseballModel.dummy()

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 90, height: 40)
        layout.minimumLineSpacing = 7
        layout.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 0, right: 10)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(BaseballViewCell.self, forCellWithReuseIdentifier: "BaseballViewCell")
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
}

extension BaseballViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return baseballItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BaseballViewCell", for: indexPath) as! BaseballViewCell
        let model = baseballItems[indexPath.item]
        cell.configure(with: model, index: indexPath.item)
        return cell
    }
}
