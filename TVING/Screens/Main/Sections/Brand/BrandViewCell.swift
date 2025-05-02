//
//  BrandViewCell.swift
//  TVING
//
//  Created by 선영주 on 5/1/25.
//

import UIKit
import SnapKit
import Then

class BrandViewCell: UICollectionViewCell {

    // MARK: - UI 컴포넌트

    private let backgroundContainer = UIView().then {
        $0.backgroundColor = UIColor(red: 37/255, green: 37/255, blue: 37/255, alpha: 1)
        $0.layer.cornerRadius = 4
        $0.clipsToBounds = true
    }

    private let logoImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
    }

    // MARK: - 초기화

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:)는 구현되지 않았습니다.")
    }

    // MARK: - 레이아웃 설정

    private func setupLayout() {
        contentView.addSubview(backgroundContainer)
        backgroundContainer.addSubview(logoImageView)

        backgroundContainer.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(90)
            make.height.equalTo(45)
        }

        logoImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(68)
            make.height.equalTo(34)
        }
    }

    // MARK: - 데이터 설정

    func configure(with model: BrandModel) {
        logoImageView.image = model.logo
    }
}
