//
//  WelcomeViewController.swift
//  SOPT36_WEEK2
//
//  Created by 선영주 on 4/24/25.
//

import UIKit
import SnapKit

final class WelcomeViewController: UIViewController {
    
    var id: String?
    
    // MARK: - UI Components
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Tving")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "??님 반가워요!"
        label.font = UIFont(name: "Pretendard-Bold", size: 23)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private let goHomeButton: UIButton = {
        let button = UIButton()
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .dsRed
        button.layer.cornerRadius = 3
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .dsBlack
        self.navigationController?.isNavigationBarHidden = true
        setupLayout()
        bindID()
        goHomeButton.addTarget(self, action: #selector(goHomeButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Functions
    
    private func setupLayout() {
        view.addSubviews(logoImageView, welcomeLabel, goHomeButton)
        
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(14)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(logoImageView.snp.width).multipliedBy(210.938 / 375.0)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(67)
            $0.centerX.equalToSuperview()
        }
        
        goHomeButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(40)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(57)
        }
    }
    
    private func bindID() {
        if let id = id {
            welcomeLabel.text = "\(id) 님\n반가워요!"
        }
    }
    
    // MARK: - Actions
    @objc private func goHomeButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
}
