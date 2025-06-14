import UIKit
import SnapKit

final class LoginViewController: UIViewController, NicknameDelegate {
    
    // MARK: - Properties

    private var nickname: String?

    // MARK: - UI Components

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TVING ID 로그인"
        label.textColor = .dsWhite
        label.font = .pretendardMedium(ofSize: 23)
        label.textAlignment = .center
        return label
    }()

    private let emailTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .gray4
        tf.textColor = .dsWhite
        tf.font = .pretendardSemiBold(ofSize: 15)
        tf.placeholder = "아이디"
        tf.setPlaceholderColor(.gray2)
        tf.setLeftPadding(12)
        tf.layer.cornerRadius = 3
        tf.borderStyle = .none
        tf.font = .pretendardSemiBold(ofSize: 15)
        tf.setLeftPadding(12)
        tf.clearButtonMode = .whileEditing
        return tf
    }()

    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .gray4
        tf.textColor = .dsWhite
        tf.font = .pretendardSemiBold(ofSize: 15)
        tf.placeholder = "비밀번호"
        tf.setPlaceholderColor(.gray2)
        tf.setLeftPadding(12)
        tf.isSecureTextEntry = true
        tf.layer.cornerRadius = 3
        tf.borderStyle = .none
        tf.font = .pretendardMedium(ofSize: 15)
        tf.setLeftPadding(12)
        tf.clearButtonMode = .whileEditing
        return tf
    }()

    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그인하기", for: .normal)
        
        button.setTitleColor(.gray2, for: .normal)
        button.titleLabel?.font = .pretendardSemiBold(ofSize: 16)

        button.backgroundColor = .dsBlack
        button.layer.cornerRadius = 3
        button.layer.masksToBounds = false
        
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 46/255, green: 46/255, blue: 46/255, alpha: 1).cgColor

        button.layer.shadowColor = UIColor.black.withAlphaComponent(0.25).cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 335, height: 52), cornerRadius: 3).cgPath

        button.isEnabled = false
        return button
    }()

    private let findIDButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("아이디 찾기", for: .normal)
        btn.setTitleColor(.gray2, for: .normal)
        btn.titleLabel?.font = .pretendardSemiBold(ofSize: 14)
        return btn
    }()

    private let findPWButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("비밀번호 찾기", for: .normal)
        btn.setTitleColor(.gray2, for: .normal)
        btn.titleLabel?.font = .pretendardSemiBold(ofSize: 14)
        return btn
    }()

    private let dividerLabel: UILabel = {
        let label = UILabel()
        label.text = "|"
        label.textColor = .gray4
        return label
    }()

    private let notMemberLabel: UILabel = {
        let label = UILabel()
        label.text = "아직 계정이 없으신가요?"
        label.textColor = .gray3
        label.font = .pretendardMedium(ofSize: 14)
        return label
    }()

    private let signupButton: UIButton = {
        let btn = UIButton()
        let title = "닉네임 만들러가기"
        let attributedTitle = NSAttributedString(string: title, attributes: [
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .foregroundColor: UIColor.gray2,
            .font: UIFont.pretendardMedium(ofSize: 14)
        ])
        btn.setAttributedTitle(attributedTitle, for: .normal)
        return btn
    }()
    
    private lazy var signupStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [notMemberLabel, signupButton])
        stack.axis = .horizontal
        stack.spacing = 22
        stack.alignment = .center
        return stack
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .dsBlack
        setupUI()
        setupActions()
        emailTextField.enableFocusBorderChange()
        passwordTextField.enableFocusBorderChange()
        addPasswordToggleButton()
        addEmailClearButton()
    }

    // MARK: - Setup UI

    private func setupUI() {
        view.addSubviews(
            titleLabel,
            emailTextField,
            passwordTextField,
            loginButton,
            findIDButton,
            findPWButton,
            dividerLabel,
            signupStackView
        )

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(80)
            $0.centerX.equalToSuperview()
        }

        emailTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(31)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(52)
        }

        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(7)
            $0.leading.trailing.equalTo(emailTextField)
            $0.height.equalTo(52)
        }

        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(32)
            $0.leading.trailing.equalTo(emailTextField)
            $0.height.equalTo(48)
        }

        dividerLabel.snp.remakeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(32)
            $0.centerX.equalToSuperview()
        }

        findIDButton.snp.remakeConstraints {
            $0.centerY.equalTo(dividerLabel)
            $0.trailing.equalTo(dividerLabel.snp.leading).offset(-36)
        }

        findPWButton.snp.remakeConstraints {
            $0.centerY.equalTo(dividerLabel)
            $0.leading.equalTo(dividerLabel.snp.trailing).offset(36)
        }
    
        signupStackView.snp.makeConstraints {
            $0.top.equalTo(dividerLabel.snp.bottom).offset(32)
            $0.centerX.equalToSuperview()
        }
        
    }

    // MARK: - Setup Actions

    private func setupActions() {
        emailTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        signupButton.addTarget(self, action: #selector(signupTapped), for:
            .touchUpInside)
    }
    
    private func addEmailClearButton() {
        let clearButton = UIButton(type: .custom)
        clearButton.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        clearButton.tintColor = .gray3
        clearButton.addTarget(self, action: #selector(clearEmail), for: .touchUpInside)

        let container = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 24))
        container.addSubview(clearButton)

        clearButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(10)
            $0.size.equalTo(20)
        }
        
        container.snp.makeConstraints {
                $0.width.equalTo(40)
                $0.height.equalTo(24)
        }

        emailTextField.rightView = container
        emailTextField.rightViewMode = .whileEditing
    }
    
    private func addPasswordToggleButton() {
        let clearButton = UIButton(type: .custom)
        clearButton.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        clearButton.tintColor = .gray3
        clearButton.addTarget(self, action: #selector(clearPassword), for: .touchUpInside)

        let eyeButton = UIButton(type: .custom)
        eyeButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        eyeButton.tintColor = .gray3
        eyeButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)

        let stackView = UIStackView(arrangedSubviews: [clearButton, eyeButton])
        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.alignment = .center

        let container = UIView()
        container.addSubview(stackView)

        stackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(6)
        }

        container.snp.makeConstraints {
            $0.width.equalTo(40)
            $0.height.equalTo(24)
        }

        passwordTextField.rightView = container
        passwordTextField.rightViewMode = .whileEditing
    }

    // MARK: - Actions
    
    @objc private func clearEmail() {
        emailTextField.text = ""
        textFieldChanged()
    }

    @objc private func textFieldChanged() {
        let isEmailNotEmpty = !(emailTextField.text ?? "").isEmpty
        let isPasswordNotEmpty = !(passwordTextField.text ?? "").isEmpty
        let isActive = isEmailNotEmpty && isPasswordNotEmpty

        loginButton.isEnabled = isActive
        loginButton.backgroundColor = isActive ? .dsRed : .gray4
        loginButton.setTitleColor(isActive ? .white : .gray2, for: .normal)
        loginButton.layer.borderWidth = isActive ? 0 : 1
    }
    
    @objc private func clearPassword() {
        passwordTextField.text = ""
        textFieldChanged()
    }

    @objc private func togglePasswordVisibility() {
        passwordTextField.isSecureTextEntry.toggle()

        if let container = passwordTextField.rightView,
           let stack = container.subviews.first as? UIStackView,
           let eyeButton = stack.arrangedSubviews.last as? UIButton {
            let iconName = passwordTextField.isSecureTextEntry ? "eye.fill" : "eye.slash.fill"
            eyeButton.setImage(UIImage(systemName: iconName), for: .normal)
        }
    }
    
    @objc private func loginTapped() {
        guard let email = emailTextField.text, email.isValidEmail else {
               return
           }

           guard let password = passwordTextField.text, password.isValidPassword else {
               return
           }

        let welcomeViewController = WelcomeViewController()
        welcomeViewController.id = nickname ?? email
        navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    @objc private func signupTapped() {
            let nicknameVC = NicknameBottomSheetViewController()
            nicknameVC.modalPresentationStyle = .pageSheet
            nicknameVC.delegate = self
            present(nicknameVC, animated: true)
        }

    // MARK: - Delegate

    func didEnterNickname(_ nickname: String) {
        self.nickname = nickname
    }
}
