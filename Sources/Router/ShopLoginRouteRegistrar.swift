// ShopLoginRouteRegistrar.swift - ShopLogin 路由注册
import ShopRouter

public final class ShopLoginRouteRegistrar: NSObject, MTRouteRegistrable {
    public static func registerRoutes() {
        MTRouter.shared.register(RouterPath.Login.main) { _ in LoginViewController() }
    }
}
