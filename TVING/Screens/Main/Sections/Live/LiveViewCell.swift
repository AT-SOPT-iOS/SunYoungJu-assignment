//
//  LiveViewCell.swift
//  TVING
//
//  Created by 선영주 on 5/1/25.
//
import UIKit

class LiveViewCell: UICollectionViewCell {

    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 3
        return iv
    }()

    private let rankLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.pretendardExtraBold(ofSize: 32)
        label.textColor = .white
        label.transform = CGAffineTransform(rotationAngle: CGFloat(5 * Double.pi / 180))
        return label
    }()

    private let broadcasterLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        return label
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.pretendardBold(ofSize: 14)
        label.textColor = .white
        return label
    }()

    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.pretendardBold(ofSize: 13)
        label.textColor = .gray
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:)는 구현되지 않았습니다.")
    }

    private func setupLayout() {
        contentView.addSubview(imageView)
        contentView.addSubview(rankLabel)
        contentView.addSubview(broadcasterLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(ratingLabel)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        rankLabel.translatesAutoresizingMaskIntoConstraints = false
        broadcasterLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 80),
            imageView.widthAnchor.constraint(equalToConstant: 160),

            rankLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            rankLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),

            broadcasterLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            broadcasterLabel.leadingAnchor.constraint(equalTo: rankLabel.trailingAnchor, constant: 5),

            titleLabel.topAnchor.constraint(equalTo: broadcasterLabel.bottomAnchor, constant: 2),
            titleLabel.leadingAnchor.constraint(equalTo: broadcasterLabel.leadingAnchor),

            ratingLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            ratingLabel.leadingAnchor.constraint(equalTo: broadcasterLabel.leadingAnchor),
            ratingLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor)
        ])
    }

    func configure(with model: LiveModel) {
        rankLabel.text = "\(model.rank)"
        imageView.image = model.image
        broadcasterLabel.text = model.broadcaster
        titleLabel.text = model.title
        ratingLabel.text = model.rating
    }
}
