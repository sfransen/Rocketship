
import UIKit
import SideMenuControllerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
	public fileprivate(set) var themeColor: UIColor? = nil

	var window: UIWindow?

	struct Global_Variables
	{
		static var Global_Percents = ""
		static var Global_Question = ""
		static var Global_WrongAnswer = ""
		static var Global_Correct_Answer = ""
		static var CORRECT_Count = 0
		static var WRONG_Count = 0
		static var TOTAL_Count = 0
		static var THEUSER = "Aila Fransen"
		static var TheTitle = "Grade 1 Additions"
	}
    func getDocumentsDirectory() -> URL
    {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

	override init()
	{
		super.init()
		self.configureAppearance()
	}
    func WriteTableHeader()
    {
        let filename = getDocumentsDirectory().appendingPathComponent("Results.html")
        do
        {
            let str = "<html><head><title>" + AppDelegate.Global_Variables.THEUSER + " " + AppDelegate.Global_Variables.TheTitle + "</title></head><body><br><br><br><br><br><br><center><h1>"
            let str2 = AppDelegate.Global_Variables.THEUSER + " " + AppDelegate.Global_Variables.TheTitle + "</h1></center>\n<table style='width: 100%;' border='4' cellpadding='4'><tbody>\n<tr><th><b>#</b></th><th><b>Class</b></th><th><b>Question</b></th><th><b>Correct Answer</b></th><th><b>Selected Answer</b></th></tr>\n"
            let str3 = str + str2
            try str3.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
        }
        catch
        {
            print("Failed to write to WriteTableHeader file")
        }
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
        WriteTableHeader()

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
