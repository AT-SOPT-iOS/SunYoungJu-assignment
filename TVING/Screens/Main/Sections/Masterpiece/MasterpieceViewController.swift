//
//  MasterpieceViewController.swift
//  TVING
//
//  Created by 선영주 on 5/1/25.
//

import UIKit
import SnapKit
import Then

class MasterpieceViewController: UIViewController {

    // MARK: - 데이터

    private let items: [MasterpieceModel] = MasterpieceModel.dummy()

    // MARK: - UI 컴포넌트

    private let titleLabel = UILabel().then {
        $0.text = "선영주PD의 인생작 TOP 6"
        $0.textColor = .white
        $0.font = UIFont.pretendardBold(ofSize: 15)
    }

    private let pageControl = UIPageControl().then {
        $0.currentPageIndicatorTintColor = .white
        $0.pageIndicatorTintColor = .gray
    }

    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
            let cellWidth = (UIScreen.main.bounds.width - 60) / 2.2
            $0.itemSize = CGSize(width: cellWidth, height: 90)
            $0.minimumLineSpacing = 10
            $0.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
    ).then {
        $0.backgroundColor = .black
        $0.showsHorizontalScrollIndicator = false
        $0.dataSource = self
        $0.delegate = self
        $0.register(MasterpieceViewCell.self, forCellWithReuseIdentifier: "MasterpieceViewCell")
    }

    // MARK: - 생명주기

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupLayout()

        pageControl.numberOfPages = items.count
    }

    // MARK: - 레이아웃 설정

    private func setupLayout() {
        [titleLabel, pageControl, collectionView].forEach { view.addSubview($0) }

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(10)
        }

        pageControl.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.trailing.equalToSuperview().inset(10)
        }

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(-30)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(90)
            make.bottom.equalToSuperview()
        }
    }
}

// MARK: - UICollectionView 데이터소스 & 델리게이트

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

    // 페이지 컨트롤 업데이트
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let itemWidth = layout.itemSize.width + layout.minimumLineSpacing

        let currentOffset = scrollView.contentOffset.x
        let page = Int((currentOffset + itemWidth / 2) / itemWidth)
        pageControl.currentPage = min(page, items.count - 1)
    }
}
