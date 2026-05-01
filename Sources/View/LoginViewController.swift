// LoginViewController.swift - 登录页面
import UIKit
import ShopBase

public class LoginViewController: BaseViewController {

    private let viewModel = LoginViewModel()

    private let logoLabel: UILabel = {
        let l = UILabel()
        l.text = "🛍 ShopApp"
        l.font = .boldSystemFont(ofSize: 32)
        l.textAlignment = .center
        return l
    }()

    private let phoneField: UITextField = {
        let f = UITextField()
        f.placeholder = "请输入手机号"
        f.keyboardType = .phonePad
        f.borderStyle = .roundedRect
        f.font = .systemFont(ofSize: 16)
        return f
    }()

    private let passwordField: UITextField = {
        let f = UITextField()
        f.placeholder = "请输入密码"
        f.isSecureTextEntry = true
        f.borderStyle = .roundedRect
        f.font = .systemFont(ofSize: 16)
        return f
    }()

    private let loginButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("登 录", for: .normal)
        b.titleLabel?.font = .boldSystemFont(ofSize: 18)
        b.backgroundColor = UIColor(red: 1.0, green: 0.3, blue: 0.3, alpha: 1.0)
        b.setTitleColor(.white, for: .normal)
        b.layer.cornerRadius = 25
        return b
    }()

    private let skipButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("跳过登录，先逛逛 >", for: .normal)
        b.titleLabel?.font = .systemFont(ofSize: 14)
        b.setTitleColor(.gray, for: .normal)
        return b
    }()

    public override func setupUI() {
        title = "登录"
        [logoLabel, phoneField, passwordField, loginButton, skipButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        NSLayoutConstraint.activate([
            logoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            phoneField.topAnchor.constraint(equalTo: logoLabel.bottomAnchor, constant: 60),
            phoneField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            phoneField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            phoneField.heightAnchor.constraint(equalToConstant: 50),

            passwordField.topAnchor.constraint(equalTo: phoneField.bottomAnchor, constant: 16),
            passwordField.leadingAnchor.constraint(equalTo: phoneField.leadingAnchor),
            passwordField.trailingAnchor.constraint(equalTo: phoneField.trailingAnchor),
            passwordField.heightAnchor.constraint(equalToConstant: 50),

            loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 32),
            loginButton.leadingAnchor.constraint(equalTo: phoneField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: phoneField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50),

            skipButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            skipButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        loginButton.addTarget(self, action: #selector(onLoginTap), for: .touchUpInside)
        skipButton.addTarget(self, action: #selector(onSkipTap), for: .touchUpInside)
    }

    public override func bindViewModel() {
        viewModel.isLoading = { [weak self] loading in
            loading ? self?.showLoading() : self?.hideLoading()
        }
        viewModel.onLoginSuccess = { [weak self] in
            self?.navigateToMain()
        }
        viewModel.onLoginFailure = { [weak self] msg in
            self?.showToast(msg)
        }
    }

    @objc private func onLoginTap() {
        view.endEditing(true)
        viewModel.login(phone: phoneField.text ?? "", password: passwordField.text ?? "")
    }

    @objc private func onSkipTap() {
        navigateToMain()
    }

    private func navigateToMain() {
        if presentingViewController != nil {
            dismiss(animated: true)
        }
    }
}
