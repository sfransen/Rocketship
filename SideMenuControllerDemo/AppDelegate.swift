
import UIKit
import RocketshipControllerSwift

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
		static var devicetype = ""
		static var screen_height = 0
		static var screen_width = 0
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
		
#if targetEnvironment(macCatalyst)
		UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }.forEach
		{
			windowScene in
			windowScene.sizeRestrictions?.minimumSize = CGSize(width: 1024, height: 1366)
			windowScene.sizeRestrictions?.maximumSize = CGSize(width: 1024, height: 1366)

		}
#endif
		// Override point for customization after application launch.
		let screenSize: CGRect = UIScreen.main.bounds
		
		print(screenSize)
		
		Global_Variables.screen_height = Int(screenSize.height)
		Global_Variables.screen_width = Int(screenSize.width)

		#if os(OSX)
			print("macOS")
		#elseif os(watchOS)
			print("watchOS")
		#elseif os(tvOS)
			print("tvOS")
		#elseif os(iOS)
			#if targetEnvironment(macCatalyst)
				print("macOS - Catalyst")
				Global_Variables.devicetype = "mac"
			#else
			print("iOS")
				if UIDevice.current.userInterfaceIdiom == .pad
				{
					print("ipad")
					if ( screenSize.height == 1024)
					{
						Global_Variables.devicetype = "ipad"
					}
					else if ( screenSize.height == 1080)
					{
						Global_Variables.devicetype = "ipad8"
					}
					else if ( screenSize.height == 1180)
					{
						Global_Variables.devicetype = "ipadAir"
					}
					else if ( screenSize.height == 1194)
					{
						Global_Variables.devicetype = "ipadPro11"
					}
					else if ( screenSize.height == 1366)
					{
						Global_Variables.devicetype = "ipadPro12"
					}
					else
					{
						Global_Variables.devicetype = "ipadUnknown"
					}
				}
				else
				{
					print("iphone")
					if ( screenSize.height == 558)
					{
						Global_Variables.devicetype = "ipod"
					}
					else if ( screenSize.height == 667)
					{
						Global_Variables.devicetype = "iphone8"
					}
					else if ( screenSize.height == 812)
					{
						Global_Variables.devicetype = "iphone11Pro"
					}
					else if ( screenSize.height == 844)
					{
						Global_Variables.devicetype = "iphone12Pro"
					}
					else if ( screenSize.height == 736)
					{
						Global_Variables.devicetype = "iphone8Plus"
					}
					else if ( screenSize.height == 896)
					{
						Global_Variables.devicetype = "iphone11ProMax"
					}
					else if ( screenSize.height == 926)
					{
						Global_Variables.devicetype = "iphone12ProMax"
					}
					else
					{
						Global_Variables.devicetype = "iphoneUnknown"
					}
				}
			#endif
		#endif
		
		print(Global_Variables.devicetype)
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
