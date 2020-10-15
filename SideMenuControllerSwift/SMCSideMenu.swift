
import Foundation
import UIKit

open class SMCSideMenu: NSObject
{
	public var viewControllerNames: [[String]] = []
	public var sectionTitles: [String] = []
	public var menuIcons: [[UIImage?]] = []
	public var menuTitles: [[String]] = []
	public var menuFont: UIFont = UIFont.systemFont(ofSize: 17.0)
	public var menuColor: UIColor = .label

	public var currentViewController: UIViewController? = nil

	public func anyClass(from className: String) -> AnyClass
    {
		if let namespace = Bundle.main.infoDictionary?["CFBundleExecutable"] as? String, let cls = NSClassFromString("\(namespace).\(className)")
        {
			return cls
		}
		return UIViewController.self
	}

	// MARK: - Override Functions
	open func viewController(in sideMenuController: SMCSideMenuController, at indexPath: IndexPath) -> UIViewController
    {
		let section: Int = indexPath.section
		let row: Int = indexPath.row
		let className: String = viewControllerNames[section][row]
		let classType = anyClass(from: className) as! UIViewController.Type

		if let currentViewController = self.currentViewController
        {
			if let navigationController: UINavigationController = currentViewController as? UINavigationController
            {
				if (navigationController.topViewController?.isKind(of: classType.self))!
                {
					return currentViewController
				}
			}
		}

		let viewController = classType.init()
		if viewController.navigationItem.leftBarButtonItem == nil
        {
			viewController.navigationItem.leftBarButtonItem = sideMenuController.menuButtonItem()
		}

		let navigationController: UINavigationController = UINavigationController(rootViewController: viewController)
		self.currentViewController = navigationController

		return navigationController
	}

	open func sideMenu(_ sideMenuController: SMCSideMenuController, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) -> Void
    {
	}

	open func sideMenu(_ sideMenuController: SMCSideMenuController, didSelectRowAt indexPath: IndexPath) -> Void
    {
	}

	open func textColorOfHeader(in section: Int) -> UIColor?
    {
		return .systemGray
	}

	open func backgroundColorOfHeader(in section: Int) -> UIColor?
    {
		return .systemBackground
	}

	open func sideMenu(_ sideMenuController: SMCSideMenuController, didShowMenu viewController: UIViewController)
    {
	}

	open func sideMenu(_ sideMenuController: SMCSideMenuController, didHideMenu viewController: UIViewController)
    {
	}

	open func startupIndexPath() -> IndexPath?
    {
		return nil
	}
}

extension SMCSideMenu: SMCSideMenuDelegate
{
	// The default view controller to show on startup. This cannot be nil.
	public func sideMenuDefaultViewController(_ sideMenuController: SMCSideMenuController) -> UIViewController
    {
		let indexPath: IndexPath =
        {
			if let indexPath = self.startupIndexPath() { return indexPath }
			return IndexPath(row: 0, section: 0)
		}()
		sideMenuController.tableView.selectRow(at: indexPath, animated: false, scrollPosition: .top)
		return viewController(in: sideMenuController, at: indexPath)
	}

	// Return the view controller to be presented when a menu row is tapped, or nil.
	public func sideMenu(_ sideMenuController: SMCSideMenuController, viewControllerForRowAt indexPath: IndexPath) -> UIViewController
    {
		return viewController(in: sideMenuController, at: indexPath)
	}

	public func sideMenu(_ sideMenuController: SMCSideMenuController, numberOfRowsInSection section: Int) -> Int
    {
		return viewControllerNames[section].count
	}

	public func sideMenu(_ sideMenuController: SMCSideMenuController, configure cell: UITableViewCell, forRowAt indexPath: IndexPath) -> UITableViewCell
    {
		cell.imageView?.image =
        {
			let section: Int = indexPath.section
			let row: Int = indexPath.row
			if !menuIcons.isEmpty
            {
				let icons = menuIcons[section]
				if row < icons.count
                {
					return icons[row]?.withRenderingMode(.alwaysTemplate)
				}
			}
			return nil
		}()
		cell.textLabel?.text =
        {
			let section: Int = indexPath.section
			let row: Int = indexPath.row
			if !menuTitles.isEmpty
            {
				let titles = menuTitles[section]
				if row < titles.count
                {
					return titles[row]
				}
			}
			return String(format: "Menu %zd-%zd", section + 1, row + 1)
		}()
		cell.textLabel?.font = menuFont
		cell.textLabel?.textColor = menuColor

		return cell
	}

	public func numberOfSections(in sideMenuController: SMCSideMenuController) -> Int
    {
		return viewControllerNames.count
	}

	public func sideMenu(_ sideMenuController: SMCSideMenuController, heightForHeaderInSection section: Int) -> CGFloat
    {
		if section < sectionTitles.count
        {
			return sectionTitles[section].count == 0 ? 5.0 : -1.0 // -1.0: Auto
		}
		return 0.0
	}

	public func sideMenu(_ sideMenuController: SMCSideMenuController, titleForHeaderInSection section: Int) -> String?
    {
		return section < sectionTitles.count ? sectionTitles[section] : nil
	}
}
