//
//  LiveViewCell.swift
//  TVING
//
//  Created by 선영주 on 5/1/25.
//

import UIKit
import SnapKit
import Then

class LiveViewCell: UICollectionViewCell {

    // MARK: - UI 컴포넌트

    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 3
    }

    private let rankLabel = UILabel().then {
        $0.font = UIFont.pretendardExtraBold(ofSize: 32)
        $0.textColor = .white
        $0.transform = CGAffineTransform(rotationAngle: CGFloat(5 * Double.pi / 180))
    }

    private let broadcasterLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        $0.textColor = .white
    }

    private let titleLabel = UILabel().then {
        $0.font = UIFont.pretendardBold(ofSize: 14)
        $0.textColor = .white
    }

    private let ratingLabel = UILabel().then {
        $0.font = UIFont.pretendardBold(ofSize: 13)
        $0.textColor = .gray
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
        [imageView, rankLabel, broadcasterLabel, titleLabel, ratingLabel].forEach {
            contentView.addSubview($0)
        }

        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(80)
            make.width.equalTo(160)
        }

        rankLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.leading.equalToSuperview()
        }

        broadcasterLabel.snp.makeConstraints { make in
            make.centerY.equalTo(rankLabel.snp.centerY)
            make.leading.equalTo(rankLabel.snp.trailing).offset(5)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(broadcasterLabel.snp.bottom).offset(2)
            make.leading.equalTo(broadcasterLabel.snp.leading)
        }

        ratingLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
            make.leading.equalTo(broadcasterLabel.snp.leading)
            make.bottom.lessThanOrEqualToSuperview()
        }
    }

    // MARK: - 데이터 설정

    func configure(with model: LiveModel) {
        rankLabel.text = "\(model.rank)"
        imageView.image = model.image
        broadcasterLabel.text = model.broadcaster
        titleLabel.text = model.title
        ratingLabel.text = model.rating
    }
}
