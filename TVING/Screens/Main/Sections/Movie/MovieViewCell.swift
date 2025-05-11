//
//  MovieViewCell.swift
//  TVING
//
//  Created by 선영주 on 5/1/25.
//

import UIKit
import SnapKit
import Then

class MovieViewCell: UICollectionViewCell {

    // MARK: - UI 컴포넌트

    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 3
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
            make.top.equalToSuperview().offset(6)
            make.bottom.equalToSuperview().inset(6)
            make.leading.equalToSuperview().offset(6)
            make.trailing.equalToSuperview().inset(6)
            // centerX, centerY는 필요없음 → 위 constraints로 충분히 위치 잡힘
        }
    }

    // MARK: - 데이터 설정

    func configure(with model: MovieModel) {
        imageView.image = model.image
    }
}
