// CTMediator+Login.swift - ShopLogin 组件的 CTMediator 扩展
import UIKit
import ShopMediator
import ShopRouter

public extension CTMediator {

    func loginViewController() -> UIViewController? {
        return performTarget("Login", action: "viewController", params: nil) as? UIViewController
    }

    func isLoggedIn() -> Bool {
        return (performTarget("Login", action: "isLoggedIn", params: nil) as? NSNumber)?.boolValue ?? false
    }

    func logout() {
        performTarget("Login", action: "logout", params: nil)
    }
}
