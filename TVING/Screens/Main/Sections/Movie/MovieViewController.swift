//
//  MovieViewController.swift
//  TVING
//
//  Created by 선영주 on 5/1/25.
//

import UIKit
import SnapKit
import Then

class MovieViewController: UIViewController {

    // MARK: - 데이터

    private let movieItems: [MovieModel] = MovieModel.dummy()

    // MARK: - UI 컴포넌트

    private let titleLabel = UILabel().then {
        $0.text = "실시간 인기 영화"
        $0.font = UIFont.pretendardBold(ofSize: 15)
        $0.textColor = .white
    }

    private let moreButton = UIButton(type: .system).then {
        $0.setTitle("더보기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.pretendardMedium(ofSize: 14)
    }

    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
            $0.itemSize = CGSize(width: 150, height: 200)
            $0.minimumLineSpacing = 4
            $0.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        }
    ).then {
        $0.isPagingEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.backgroundColor = .black
        $0.dataSource = self
        $0.delegate = self
        $0.register(MovieViewCell.self, forCellWithReuseIdentifier: "MovieViewCell")
    }

    // MARK: - 생명주기

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupLayout()
    }

    // MARK: - 레이아웃 설정

    private func setupLayout() {
        [titleLabel, moreButton, collectionView].forEach { view.addSubview($0) }

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(20)
        }

        moreButton.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.trailing.equalToSuperview().inset(20)
        }

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(200)
            make.bottom.equalToSuperview()
        }
    }
}

// MARK: - UICollectionView 데이터소스 & 델리게이트

extension MovieViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieViewCell", for: indexPath) as! MovieViewCell
        let model = movieItems[indexPath.item]
        cell.configure(with: model)
        return cell
    }
}
