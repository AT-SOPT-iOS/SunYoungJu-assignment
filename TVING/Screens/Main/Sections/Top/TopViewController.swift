//
//  TopViewController.swift
//  TVING
//
//  Created by 선영주 on 5/1/25.
//

import UIKit
import SnapKit
import Then

class TopViewController: UIViewController {

    // MARK: - 데이터
    private let topItems: [TopModel] = TopModel.dummy()
    
    // MARK: - UI 컴포넌트

    private let titleLabel = UILabel().then {
        $0.text = "오늘의 티빙 TOP 20"
        $0.textColor = .white
        $0.font = UIFont.pretendardBold(ofSize: 15)
    }

    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
            $0.itemSize = CGSize(width: 150, height: 200)
            $0.minimumLineSpacing = 11
            $0.sectionInset = UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 0)
        }
    ).then {
        $0.backgroundColor = .black
        $0.dataSource = self
        $0.delegate = self
        $0.register(TopViewCell.self, forCellWithReuseIdentifier: "TopViewCell")
        $0.showsHorizontalScrollIndicator = false
    }

    // MARK: - 생명주기

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupLayout()
    }

    // MARK: - 레이아웃 설정

    private func setupLayout() {
        view.addSubview(titleLabel)
        view.addSubview(collectionView)

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(5)
        }

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(-10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(200)
            make.bottom.equalToSuperview()
        }
    }
}

// MARK: - 컬렉션뷰 데이터소스 & 델리게이트

extension TopViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopViewCell", for: indexPath) as! TopViewCell
        cell.configure(with: topItems[indexPath.item])
        return cell
    }
}
