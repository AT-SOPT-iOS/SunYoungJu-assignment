//
//  BaseballViewCell.swift
//  TVING
//
//  Created by 선영주 on 5/1/25.
//
import UIKit

class BaseballViewCell: UICollectionViewCell {
    
    private let backgroundContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        return view
    }()
    
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:)는 구현되지 않았습니다.")
    }
    
    private func setupLayout() {
        contentView.addSubview(backgroundContainer)
        backgroundContainer.addSubview(logoImageView)
        
        backgroundContainer.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundContainer.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            backgroundContainer.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            backgroundContainer.widthAnchor.constraint(equalToConstant: 90),
            backgroundContainer.heightAnchor.constraint(equalToConstant: 45),
            
            logoImageView.topAnchor.constraint(equalTo: backgroundContainer.topAnchor, constant: 5),
            logoImageView.leadingAnchor.constraint(equalTo: backgroundContainer.leadingAnchor, constant: 5),
            logoImageView.trailingAnchor.constraint(equalTo: backgroundContainer.trailingAnchor, constant: -5),
            logoImageView.bottomAnchor.constraint(equalTo: backgroundContainer.bottomAnchor, constant: -5)
        ])
    }
    
    func configure(with model: BaseballModel, index: Int) {
        logoImageView.image = model.teamLogo
        
        // index가 짝수면 흰색, 홀수면 검정색 배경
        if index % 2 == 0 {
            backgroundContainer.backgroundColor = .white
        } else {
            backgroundContainer.backgroundColor = .black
        }
    }
}
