//
//  BaseballViewCell.swift
//  TVING
//
//  Created by 선영주 on 5/1/25.
//

import UIKit
import SnapKit
import Then

class BaseballViewCell: UICollectionViewCell {

    // MARK: - UI 컴포넌트

    private let backgroundContainer = UIView().then {
        $0.clipsToBounds = true
        $0.backgroundColor = .white
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

    // MARK: - 레이아웃

    private func setupLayout() {
        contentView.addSubview(backgroundContainer)
        backgroundContainer.addSubview(logoImageView)

        backgroundContainer.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(50)
        }

        logoImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(45)
        }
    }

    // MARK: - 데이터 설정

    func configure(with model: BaseballModel, index: Int) {
        logoImageView.image = model.teamLogo

        // index가 짝수면 흰색, 홀수면 검정색 배경
        backgroundContainer.backgroundColor = (index % 2 == 0) ? .white : .black
    }
}
