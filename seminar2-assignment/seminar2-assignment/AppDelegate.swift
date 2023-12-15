import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let navigationController = UINavigationController() // UINavigationController 생성
        let viewController = ViewController() // ViewController 생성
        navigationController.viewControllers = [viewController] // ViewController를 UINavigationController에 설정
        
        window?.rootViewController = navigationController // UINavigationController를 루트 뷰 컨트롤러로 설정
        window?.makeKeyAndVisible()
        

        
        
        
        return true
    }
}
