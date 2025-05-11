//
//  NicknameBottomSheetViewController.swift
//  SOPT36_WEEK2
//
//  Created by 선영주 on 4/24/25.
//

import UIKit
import SnapKit

protocol NicknameDelegate: AnyObject {
    func didEnterNickname(_ nickname: String)
}

final class NicknameBottomSheetViewController: UIViewController {
    
    weak var delegate: NicknameDelegate?
    
    // MARK: - UI Components
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "닉네임을 입력해주세요"
        label.font = .pretendardMedium(ofSize: 23)
        label.textColor = .black
        return label
    }()
    
    let nicknameTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .gray2
        tf.textColor = .black
        tf.font = .pretendardSemiBold(ofSize: 14)
        tf.layer.cornerRadius = 6
        tf.setLeftPadding(12)
        return tf
    }()
    
    private let saveButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("저장하기", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .dsRed
        btn.titleLabel?.font = .pretendardSemiBold(ofSize: 14)
        btn.layer.cornerRadius = 12
        return btn
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBottomSheetStyle()
        setupLayout()
        setupActions()
    }
    
    // MARK: - BottomSheet Config
    
    private func setupBottomSheetStyle() {
        view.backgroundColor = .white
        if let sheet = sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = false
            sheet.preferredCornerRadius = 20
            sheet.largestUndimmedDetentIdentifier = nil
            sheet.prefersGrabberVisible = true
        }
    }
    
    // MARK: - Layout
    
    private func setupLayout() {
        view.addSubviews(titleLabel, nicknameTextField, saveButton)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.equalToSuperview().offset(21)
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(52)
        }
        
        saveButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(24)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(52)
        }
    }
    
    // MARK: - Actions
    
    private func setupActions() {
        saveButton.addTarget(self, action: #selector(saveNickname), for: .touchUpInside)
    }
    
    @objc private func saveNickname() {
        let nickname = nicknameTextField.text ?? ""
        
        guard nickname.isValidNickname else { return }
        
        delegate?.didEnterNickname(nickname)
        dismiss(animated: true)
    }
}
