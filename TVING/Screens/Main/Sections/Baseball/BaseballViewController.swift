//
//  BaseballViewController.swift
//  TVING
//
//  Created by 선영주 on 5/1/25.
//

import UIKit
import SnapKit
import Then

class BaseballViewController: UIViewController {

    // MARK: - 데이터

    private let baseballItems: [BaseballModel] = BaseballModel.dummy()

    // MARK: - UI 컴포넌트

    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
            $0.itemSize = CGSize(width: 80, height: 50)
            $0.minimumLineSpacing = 7
            $0.sectionInset = UIEdgeInsets(top: 5, left: 15, bottom: 0, right: 15)
        }
    ).then {
        $0.backgroundColor = .black
        $0.dataSource = self
        $0.delegate = self
        $0.register(BaseballViewCell.self, forCellWithReuseIdentifier: "BaseballViewCell")
    }

    // MARK: - 생명주기

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupLayout()
    }

    // MARK: - 레이아웃

    private func setupLayout() {
        view.addSubview(collectionView)

        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(80) // 셀보다 살짝 높여서 여유 공간
            make.bottom.equalToSuperview() // 혹시 부모 뷰의 높이가 다를 때 대비
        }
    }
}

// MARK: - UICollectionView 데이터소스 & 델리게이트

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
