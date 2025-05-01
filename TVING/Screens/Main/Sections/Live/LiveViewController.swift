//
//  LiveViewController.swift
//  TVING
//
//  Created by 선영주 on 5/1/25.
//
import UIKit

class LiveViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    

    private let liveItems: [LiveModel] = LiveModel.dummy()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "실시간 인기 LIVE"
        label.font = UIFont.pretendardBold(ofSize: 15)
        label.textColor = .white
        return label
    }()

    private let moreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("더보기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.pretendardRegular(ofSize: 15)
        return button
    }()

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 160, height: 170)
        layout.minimumLineSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(LiveViewCell.self, forCellWithReuseIdentifier: "LiveViewCell")
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(titleLabel)
        view.addSubview(moreButton)
        view.addSubview(collectionView)

        setupLayout()
    }

    private func setupLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            moreButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            moreButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 180),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor) // 마지막 하단 anchor
        ])
    }
}

extension LiveViewController {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return liveItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LiveViewCell", for: indexPath) as! LiveViewCell
        cell.configure(with: liveItems[indexPath.item])
        return cell
    }
}
