//
//  MasterpieceViewCell.swift
//  TVING
//
//  Created by 선영주 on 5/1/25.
//

import UIKit
import SnapKit
import Then

class MasterpieceViewCell: UICollectionViewCell {

    // MARK: - UI 컴포넌트

    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 3
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
        contentView.addSubview(imageView)

        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(160)
            make.height.equalTo(90)
        }
    }

    // MARK: - 데이터 설정

    func configure(with model: MasterpieceModel) {
        imageView.image = model.image
    }
}
