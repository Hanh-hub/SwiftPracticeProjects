import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // This method is called when the app finishes launching.
        print("App finished launching")
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // This method is called when the app is about to become inactive.
        print("App about to become inactive")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // This method is called when the app enters the background.
        print("App entered background")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // This method is called when the app is about to enter the foreground.
        print("App about to enter foreground")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // This method is called when the app becomes active.
        print("App became active")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // This method is called when the app is about to terminate.
        print("App about to terminate")
    }

}

