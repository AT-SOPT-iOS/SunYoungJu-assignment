//
//  LiveViewController.swift
//  TVING
//
//  Created by 선영주 on 5/1/25.
//

import UIKit
import SnapKit
import Then

class LiveViewController: UIViewController {

    // MARK: - 데이터

    private let liveItems: [LiveModel] = LiveModel.dummy()

    // MARK: - UI 컴포넌트

    private let titleLabel = UILabel().then {
        $0.text = "실시간 인기 LIVE"
        $0.font = UIFont.pretendardBold(ofSize: 15)
        $0.textColor = .white
    }

    private let moreButton = UIButton(type: .system).then {
        $0.setTitle("더보기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.pretendardRegular(ofSize: 15)
    }

    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
            $0.itemSize = CGSize(width: 160, height: 170)
            $0.minimumLineSpacing = 12
            $0.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
    ).then {
        $0.backgroundColor = .black
        $0.dataSource = self
        $0.delegate = self
        $0.register(LiveViewCell.self, forCellWithReuseIdentifier: "LiveViewCell")
    }

    // MARK: - 생명주기

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupLayout()
    }

    // MARK: - 레이아웃

    private func setupLayout() {
        [titleLabel, moreButton, collectionView].forEach { view.addSubview($0) }

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
        }

        moreButton.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.trailing.equalToSuperview().offset(-20)
        }

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(180)
            make.bottom.equalToSuperview()
        }
    }
}

// MARK: - 컬렉션뷰 데이터소스

extension LiveViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return liveItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LiveViewCell", for: indexPath) as! LiveViewCell
        cell.configure(with: liveItems[indexPath.item])
        return cell
    }
}
