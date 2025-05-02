//
//  BannerViewCell.swift
//  TVING
//
//  Created by 선영주 on 5/1/25.
//
import UIKit
import SnapKit
import Then

class BannerViewCell: UICollectionViewCell {

    // MARK: - UI 컴포넌트
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }

    // MARK: - 초기화
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:)는 구현되지 않았습니다.")
    }

    // MARK: - 레이아웃 설정
    private func setupLayout() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    // MARK: - 데이터 설정
    func configure(with model: BannerModel) {
        imageView.image = model.image
    }
}
