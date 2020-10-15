
import UIKit
import SideMenuControllerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
	public fileprivate(set) var themeColor: UIColor? = nil

	var window: UIWindow?
    
	override init()
    {
		super.init()
		self.configureAppearance()
	}

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
		// Override point for customization after application launch.
        let screenSize: CGRect = UIScreen.main.bounds
        print(screenSize)
        UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }.forEach { windowScene in
            windowScene.sizeRestrictions?.minimumSize = CGSize(width: 1024, height: 1366)
            windowScene.sizeRestrictions?.maximumSize = CGSize(width: 1024, height: 1366)

        }

		// Create full-screen window
		self.window = UIWindow(frame: UIScreen.main.bounds)
		self.window?.backgroundColor = .white

		// Make root view controller
		self.window?.rootViewController =
        {
			let sideMenu: SideMenu = SideMenu()
			return SMCSideMenuController(delegate: sideMenu, style: .grouped)
		}()

		// Show window
		self.window?.makeKeyAndVisible()

		return true
	}

	func applicationWillResignActive(_ application: UIApplication)
    {
		/*
		 * Sent when the application is about to move from active to inactive state.
		 * This can occur for certain types of temporary interruptions (such as an
		 * incoming phone call or SMS message) or when the user quits
		 * the application and it begins the transition to the background state.
		 * Use this method to pause ongoing tasks, disable timers, and invalidate
		 * graphics rendering callbacks. Games should use this method to pause
		 * the game.
		 */
	}

	func applicationDidEnterBackground(_ application: UIApplication)
    {
		/*
		 * Use this method to release shared resources, save user data,
		 * invalidate timers, and store enough application state information
		 * to restore your application to its current state in case it is
		 * terminated later.
		 * If your application supports background execution, this method is called
		 * instead of applicationWillTerminate: when the user quits.
		 */
	}

	func applicationWillEnterForeground(_ application: UIApplication)
    {
		/*
		 * Called as part of the transition from the background to the active state;
		 * here you can undo many of the changes made on entering the background.
		 */
	}

	func applicationDidBecomeActive(_ application: UIApplication)
    {
		/*
		 * Restart any tasks that were paused (or not yet started)
		 * while the application was inactive. If the application was previously
		 * in the background, optionally refresh the user interface.
		 */
	}

	func applicationWillTerminate(_ application: UIApplication)
    {
		/*
		 * Called when the application is about to terminate.
		 * Save data if appropriate. See also applicationDidEnterBackground:.
		 */
	}
}

extension AppDelegate
{
	fileprivate func configureAppearance()
    {
		let barColor: UIColor = .blue

		UINavigationBar.appearance().barTintColor = barColor
		UITabBar.appearance().barTintColor = barColor
		UIToolbar.appearance().barTintColor = barColor
		UISearchBar.appearance().barTintColor = barColor

		UISegmentedControl.appearance().tintColor = barColor
		UIStepper.appearance().tintColor = barColor
		UISwitch.appearance().onTintColor = barColor

		UINavigationBar.appearance().titleTextAttributes = [ .foregroundColor: UIColor.white ]
		UINavigationBar.appearance().tintColor = UIColor.white
		UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).setTitleTextAttributes([ .foregroundColor : UIColor.white ], for: [.normal])

		UILabel.appearance(whenContainedInInstancesOf: [UITableViewHeaderFooterView.self]).textColor = barColor

		self.themeColor = barColor
	}
}
