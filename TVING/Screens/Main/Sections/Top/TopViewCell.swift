//
//  TopViewCell.swift
//  TVING
//
//  Created by 선영주 on 5/1/25.
//

import UIKit
import SnapKit
import Then

class TopViewCell: UICollectionViewCell {

    // MARK: - UI 컴포넌트

    private let rankLabel = UILabel().then {
        $0.font = UIFont.pretendardExtraBold(ofSize: 58)
        $0.textColor = .white
        $0.transform = CGAffineTransform(rotationAngle: CGFloat(5 * Double.pi / 180))
    }

    private let posterImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 3
    }

    // MARK: - 초기화

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(rankLabel)
        contentView.addSubview(posterImageView)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:)는 구현되지 않았습니다.")
    }

    // MARK: - 레이아웃 설정

    private func setupLayout() {
        rankLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().inset(10)
            make.width.greaterThanOrEqualTo(40)
        }

        posterImageView.snp.makeConstraints { make in
            make.leading.equalTo(rankLabel.snp.trailing).offset(3)
            make.centerY.equalToSuperview()
            make.width.equalTo(98)
            make.height.equalTo(146)
        }
    }

    // MARK: - 데이터 설정

    func configure(with model: TopModel) {
        rankLabel.text = "\(model.rank)"
        posterImageView.image = model.poster
    }
}
