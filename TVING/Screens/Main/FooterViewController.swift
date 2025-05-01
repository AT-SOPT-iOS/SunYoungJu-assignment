//
//  FooterViewController.swift
//  TVING
//
//  Created by 선영주 on 5/2/25.
//
import UIKit

class FooterViewController: UIViewController {

    private let noticeView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 37/255, green: 37/255, blue: 37/255, alpha: 1)
        view.layer.cornerRadius = 8
        return view
    }()

    private let noticeLabel: UILabel = {
        let label = UILabel()
        label.text = "공지   티빙 계정 공유 정책 추가 안내"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    private let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .white
        return imageView
    }()

    private let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "고객문의 · 이용약관 · 개인정보처리방침\n사업자정보 · 인재채용"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = 2
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupLayout()
    }

    private func setupLayout() {
        view.addSubview(noticeView)
        noticeView.addSubview(noticeLabel)
        noticeView.addSubview(arrowImageView)
        view.addSubview(infoLabel)

        noticeView.translatesAutoresizingMaskIntoConstraints = false
        noticeLabel.translatesAutoresizingMaskIntoConstraints = false
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            noticeView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            noticeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            noticeView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            noticeView.heightAnchor.constraint(equalToConstant: 50),

            noticeLabel.centerYAnchor.constraint(equalTo: noticeView.centerYAnchor),
            noticeLabel.leadingAnchor.constraint(equalTo: noticeView.leadingAnchor, constant: 10),

            arrowImageView.centerYAnchor.constraint(equalTo: noticeView.centerYAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: noticeView.trailingAnchor, constant: -10),
            arrowImageView.widthAnchor.constraint(equalToConstant: 10),

            infoLabel.topAnchor.constraint(equalTo: noticeView.bottomAnchor, constant: 10),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            infoLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor) // 마지막
        ])
    }
}
