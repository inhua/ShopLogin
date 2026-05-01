// Target_Login.swift - 登录组件对外暴露的 Target-Action 入口
import UIKit
import ShopBusinessBase

@objc(Target_Login)
public class Target_Login: NSObject {

    @objc public func action_viewController(_ params: [String: Any]?) -> UIViewController {
        return LoginViewController()
    }

    @objc public func action_isLoggedIn(_ params: [String: Any]?) -> NSNumber {
        return NSNumber(value: UserSession.shared.isLoggedIn)
    }

    @objc public func action_logout(_ params: [String: Any]?) {
        UserSession.shared.logout()
    }
}
