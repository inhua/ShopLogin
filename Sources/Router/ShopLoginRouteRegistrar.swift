// ShopLoginRouteRegistrar.swift - ShopLogin 路由自注册
import ShopRouter

public final class ShopLoginRouteRegistrar: NSObject, MTRouteRegistrable {
    override public class func initialize() {
        super.initialize()
        guard self === ShopLoginRouteRegistrar.self else { return }
        registerRoutes()
    }

    public static func registerRoutes() {
        MTRouter.shared.register(RouterPath.Login.main) { _ in LoginViewController() }
    }
}
