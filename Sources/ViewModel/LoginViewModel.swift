// LoginViewModel.swift - 登录模块ViewModel
import Foundation
import ShopBase
import ShopBusinessBase

public class LoginViewModel {

    public var onLoginSuccess: (() -> Void)?
    public var onLoginFailure: ((String) -> Void)?
    public var isLoading: ((Bool) -> Void)?

    public init() {}

    public func login(phone: String, password: String) {
        guard !phone.isEmpty, !password.isEmpty else {
            onLoginFailure?("手机号和密码不能为空")
            return
        }
        guard isValidPhone(phone) else {
            onLoginFailure?("请输入正确的手机号")
            return
        }
        isLoading?(true)

        // 模拟网络请求（实际替换为 NetworkService.shared.request）
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.isLoading?(false)
            let mockUser = UserModel(id: "001", nickname: "用户\(phone.suffix(4))",
                                     avatar: "", phone: phone, email: "")
            UserSession.shared.login(token: "mock_token_\(phone)", user: mockUser)
            self?.onLoginSuccess?()
        }
    }

    private func isValidPhone(_ phone: String) -> Bool {
        let regex = "^1[3-9]\\d{9}$"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: phone)
    }
}
