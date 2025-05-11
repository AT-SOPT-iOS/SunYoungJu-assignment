//
//  BrandViewController.swift
//  TVING
//
//  Created by 선영주 on 5/1/25.
//
import UIKit
import SnapKit
import Then

class BrandViewController: UIViewController {

    // MARK: - 데이터
    private let brandItems: [BrandModel] = BrandModel.dummy()

    // MARK: - UI 컴포넌트

    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
            $0.itemSize = CGSize(width: 90, height: 45)
            $0.minimumLineSpacing = 7
            $0.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        }
    ).then {
        $0.backgroundColor = .black
        $0.dataSource = self
        $0.delegate = self
        $0.register(BrandViewCell.self, forCellWithReuseIdentifier: "BrandViewCell")
    }

    // MARK: - 생명주기

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupLayout()
    }

    // MARK: - 레이아웃 설정

    private func setupLayout() {
        view.addSubview(collectionView)

        collectionView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(55)
        }
    }
}

// MARK: - UICollectionView DataSource & Delegate

extension BrandViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return brandItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrandViewCell", for: indexPath) as! BrandViewCell
        cell.configure(with: brandItems[indexPath.item])
        return cell
    }
}
