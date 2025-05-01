//
//  MasterpieceViewController.swift
//  TVING
//
//  Created by 선영주 on 5/1/25.
//
import UIKit

class MasterpieceViewController: UIViewController {

    private let items: [MasterpieceModel] = MasterpieceModel.dummy()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "선영주PD의 인생작 TOP 6"
        label.textColor = .white
        label.font = UIFont.pretendardBold(ofSize: 15)
        return label
    }()

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        let cellWidth = (UIScreen.main.bounds.width - 60) / 2.2
        layout.itemSize = CGSize(width: cellWidth, height: 90)
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MasterpieceViewCell.self, forCellWithReuseIdentifier: "MasterpieceViewCell")
        return collectionView
    }()

    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPageIndicatorTintColor = .white
        pc.pageIndicatorTintColor = .gray
        return pc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupLayout()

        pageControl.numberOfPages = items.count
    }

    private func setupLayout() {
        view.addSubview(titleLabel)
        view.addSubview(pageControl)
        view.addSubview(collectionView)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            pageControl.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
}

extension MasterpieceViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MasterpieceViewCell", for: indexPath) as! MasterpieceViewCell
        let model = items[indexPath.item]
        cell.configure(with: model)
        return cell
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let itemWidth = layout.itemSize.width + layout.minimumLineSpacing

        let currentOffset = scrollView.contentOffset.x
        let page = Int((currentOffset + itemWidth / 2) / itemWidth)
        pageControl.currentPage = min(page, items.count - 1)
    }
}
