# SideMenuControllerSwift


## How to use SideMenuControllerSwift.framework

## Example


```SideMenu.swift
class SideMenu: SMCSideMenu
{
	override init() {
	super.init()

	self.viewControllerNames = [
		[
		"OneViewController",
		"TwoViewController",
		"ThreeViewController"
		],
		[
		"FourViewController",
		"FiveViewController"
		]
	]
	self.sectionTitles = [
		"Main",
		"Others"
	]
	self.menuTitles = [
		[
		"Timeline",
		"Favorites",
		"Bookmarks"
		],
		[
		"Settings",
		"Information",
		]
	]
	}
}
```

AppDelegate	window.rootViewController

```AppDelegate.swift
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
	// Create full-screen window
	self.window = UIWindow(frame: UIScreen.main.bounds)
	self.window?.backgroundColor = .white

	// Make root view controller
	self.window?.rootViewController = {
		let sideMenu: SideMenu = SideMenu()
		return SMCSideMenuController(delegate: sideMenu, style: .grouped)
	}()

	// Show window
	self.window?.makeKeyAndVisible()

	return true
	}
```

SideMenuControllerDemo AppDelegate.swift SideMenu.swift


## Requirements

 - Swift 5.0
 - iOS 13.3 or later
 - Xcode 11.3 or later

