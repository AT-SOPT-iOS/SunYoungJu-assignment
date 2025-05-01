//
//  MovieViewCell.swift
//  TVING
//
//  Created by 선영주 on 5/1/25.
//
import UIKit

class MovieViewCell: UICollectionViewCell {

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
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with model: MovieModel) {
        imageView.image = model.image
    }
}
