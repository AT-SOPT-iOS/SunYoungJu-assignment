//
//  BannerViewController.swift
//  TVING
//
//  Created by 선영주 on 5/1/25.
//
import UIKit
import SnapKit
import Then

class BannerViewController: UIViewController {

    // MARK: - 데이터
    private let bannerItems: [BannerModel] = BannerModel.dummy()

    // MARK: - UI 컴포넌트
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
            $0.minimumLineSpacing = 0
        }
    ).then {
        $0.isPagingEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.dataSource = self
        $0.delegate = self
        $0.register(BannerViewCell.self, forCellWithReuseIdentifier: "BannerViewCell")
        $0.backgroundColor = .black
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
            make.edges.equalToSuperview()
        }
    }

    // MARK: - 레이아웃 사이즈 조정
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = collectionView.frame.size
        }
    }
}

// MARK: - UICollectionView DataSource & Delegate
extension BannerViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerViewCell", for: indexPath) as! BannerViewCell
        let model = bannerItems[indexPath.item]
        cell.configure(with: model)
        return cell
    }
}
