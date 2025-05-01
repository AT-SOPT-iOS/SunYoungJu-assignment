//
//  MasterpieceViewCell.swift
//  TVING
//
//  Created by 선영주 on 5/1/25.
//
import UIKit

class MasterpieceViewCell: UICollectionViewCell {

    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 3
        return iv
    }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupLayout()
        }

    private func setupLayout() {
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 160),
            imageView.heightAnchor.constraint(equalToConstant: 90)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:)는 구현되지 않았습니다.")
    }

    func configure(with model: MasterpieceModel) {
        imageView.image = model.image
    }
}
