
import Foundation
import UIKit

public protocol SMCSideMenuDelegate: class
{
	// Override default view controller indexPath to show on startup.
	func startupIndexPath() -> IndexPath?

	// The default view controller to show on startup. This cannot be nil.
	func sideMenuDefaultViewController(_ sideMenuController: SMCSideMenuController) -> UIViewController

	// Return the view controller to be presented when a menu row is tapped.
	func sideMenu(_ sideMenuController: SMCSideMenuController, viewControllerForRowAt indexPath: IndexPath) -> UIViewController

	// DataSource for UITableView
	func numberOfSections(in sideMenuController: SMCSideMenuController) -> Int
	func sideMenu(_ sideMenuController: SMCSideMenuController, numberOfRowsInSection section: Int) -> Int
	func sideMenu(_ sideMenuController: SMCSideMenuController, configure cell: UITableViewCell, forRowAt indexPath: IndexPath) -> UITableViewCell
	func sideMenu(_ sideMenuController: SMCSideMenuController, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) -> Void
	func sideMenu(_ sideMenuController: SMCSideMenuController, heightForHeaderInSection section: Int) -> CGFloat
	func sideMenu(_ sideMenuController: SMCSideMenuController, didSelectRowAt indexPath: IndexPath) -> Void

	// Delegate for UITableView
	func sideMenu(_ sideMenuController: SMCSideMenuController, titleForHeaderInSection section: Int) -> String?

	// Colors for Section Header in UITableView
	func textColorOfHeader(in section: Int) -> UIColor?
	func backgroundColorOfHeader(in section: Int) -> UIColor?

	// Events on Menu
	func sideMenu(_ sideMenuController: SMCSideMenuController, didShowMenu viewController: UIViewController) -> Void
	func sideMenu(_ sideMenuController: SMCSideMenuController, didHideMenu viewController: UIViewController) -> Void
}


// MARK: - Default Implementation
extension SMCSideMenuDelegate
{
	public func startupIndexPath() -> IndexPath?
    {
		return nil
	}

	public func textColorOfHeader(in section: Int) -> UIColor?
    {
		return nil
	}

	public func backgroundColorOfHeader(in section: Int) -> UIColor?
    {
		return nil
	}
}

// MARK: - Default Implementation
extension SMCSideMenuDelegate
{
	public func numberOfSections(in sideMenuController: SMCSideMenuController) -> Int
    {
		return 1
	}

	public func sideMenu(_ sideMenuController: SMCSideMenuController, numberOfRowsInSection section: Int) -> Int
    {
		return 0
	}

	public func sideMenu(_ sideMenuController: SMCSideMenuController, configure cell: UITableViewCell, forRowAt indexPath: IndexPath) -> UITableViewCell
    {
		return UITableViewCell()
	}

	public func sideMenu(_ sideMenuController: SMCSideMenuController, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) -> Void
    {
	}

	public func sideMenu(_ sideMenuController: SMCSideMenuController, heightForHeaderInSection section: Int) -> CGFloat
    {
		return 0.0
	}

	public func sideMenu(_ sideMenuController: SMCSideMenuController, didSelectRowAt indexPath: IndexPath) -> Void
    {
	}
}

// MARK: - Default Implementation
extension SMCSideMenuDelegate
{
	public func sideMenu(_ sideMenuController: SMCSideMenuController, titleForHeaderInSection section: Int) -> String?
    {
		return nil
	}
}

// MARK: - Default Implementation
extension SMCSideMenuDelegate
{
	public func sideMenu(_ sideMenuController: SMCSideMenuController, didShowMenu viewController: UIViewController)
    {
	}

	public func sideMenu(_ sideMenuController: SMCSideMenuController, didHideMenu viewController: UIViewController)
    {
	}
}
