//
//  FooterViewController.swift
//  TVING
//
//  Created by 선영주 on 5/2/25.
//

import UIKit
import SnapKit
import Then

class FooterViewController: UIViewController {

    // MARK: - UI 컴포넌트

    private let noticeView = UIView().then {
        $0.backgroundColor = UIColor(red: 37/255, green: 37/255, blue: 37/255, alpha: 1)
        $0.layer.cornerRadius = 8
    }

    private let noticeLabel = UILabel().then {
        $0.text = "공지   티빙 계정 공유 정책 추가 안내"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 14)
    }

    private let arrowImageView = UIImageView().then {
        $0.image = UIImage(systemName: "chevron.right")
        $0.tintColor = .white
    }

    private let infoLabel = UILabel().then {
        $0.text = "고객문의 · 이용약관 · 개인정보처리방침\n사업자정보 · 인재채용"
        $0.textColor = .lightGray
        $0.font = UIFont.systemFont(ofSize: 13)
        $0.numberOfLines = 2

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5

        let attributedString = NSMutableAttributedString(
            string: "고객문의 · 이용약관 · 개인정보처리방침\n사업자정보 · 인재채용",
            attributes: [
                .paragraphStyle: paragraphStyle
            ]
        )
        $0.attributedText = attributedString
    }

    // MARK: - 생명주기

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupLayout()
        
        infoLabel.applyBoldColor(
                targetStrings: ["개인정보처리방침"],
                fontSize: 13,
                color: .white
        )
    }

    // MARK: - 레이아웃 설정

    private func setupLayout() {
        [noticeView, infoLabel].forEach { view.addSubview($0) }
        [noticeLabel, arrowImageView].forEach { noticeView.addSubview($0) }

        noticeView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }

        noticeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
        }

        arrowImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(10)
            make.width.equalTo(10)
        }

        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(noticeView.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
    }
}

// MARK: - 특정 문자열들에 대해 볼드+색상 적용
extension UILabel {
    func applyBoldColor(targetStrings: [String], fontSize: CGFloat? = nil, color: UIColor? = nil) {
        guard let fullText = self.text else { return }

        let attributedString: NSMutableAttributedString
        if let current = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: current)
        } else {
            attributedString = NSMutableAttributedString(string: fullText)
        }

        for target in targetStrings {
            let range = (fullText as NSString).range(of: target)
            if range.location != NSNotFound {
                attributedString.addAttributes([
                    .font: UIFont.boldSystemFont(ofSize: fontSize ?? self.font.pointSize),
                    .foregroundColor: color ?? self.textColor ?? .white
                ], range: range)
            }
        }

        self.attributedText = attributedString
    }
}
