//
//  BrandViewCell.swift
//  TVING
//
//  Created by 선영주 on 5/1/25.
//
import UIKit

class BrandViewCell: UICollectionViewCell {

    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 4
        iv.backgroundColor = UIColor(red: 37/255, green: 37/255, blue: 37/255, alpha: 1)
        return iv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(logoImageView)

        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            logoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            logoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            logoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with model: BrandModel) {
        logoImageView.image = model.logo
    }
}
