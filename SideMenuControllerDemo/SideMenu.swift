
import Foundation
import UIKit
import SideMenuControllerSwift

class SideMenu: SMCSideMenu
{
	override init()
	{
		super.init()

		self.viewControllerNames = [
			[
				"GradeOne_OneViewController",
				"GradeOne_TwoViewController",
				"GradeOne_ThreeViewController"
			],
			[
				"GradeTwo_OneViewController",
				"GradeTwo_TwoViewController",
				"GradeTwo_ThreeViewController"
			],
			[
				"GradeThree_OneViewController",
				"GradeThree_TwoViewController",
				"GradeThree_ThreeViewController"
			],
			[
				"GradeFour_OneViewController",
				"GradeFour_TwoViewController",
				"GradeFour_ThreeViewController"
			],
			[
				"GradeFive_OneViewController",
				"GradeFive_ViewController",
				"GradeFive_ViewController"
			],
			[
				"Settings_ViewController",
				"Results_ViewController"
			]
		]
		self.sectionTitles = [
			"Grade 1",
			"Grade 2",
			"Grade 3",
			"Grade 4",
			"Grade 5",
			"Settings"
		 ]
		self.menuTitles = [
			[
				"Additions",
				"Subtraction",
				"Multiplication"
			],
			[
				"Additions",
				"Subtraction",
				"Multiplication"
			],
			[
				"Additions",
				"Subtraction",
				"Multiplication"
			],
			[
				"Additions",
				"Subtraction",
				"Multiplication"

			],
			[
				"Additions",
				"Subtraction",
				"Multiplication"
			],
			[
				"Settings",
				"Results",
			]
		]
		self.menuIcons = [
			[
				UIImage(named: "icon_timeline"),
				UIImage(named: "icon_favorites"),
				UIImage(named: "icon_bookmarks")
			],
			[
				UIImage(named: "icon_timeline"),
				UIImage(named: "icon_favorites"),
				UIImage(named: "icon_bookmarks")
			],
			[
				UIImage(named: "icon_timeline"),
				UIImage(named: "icon_favorites"),
				UIImage(named: "icon_bookmarks")
			],
			[
				UIImage(named: "icon_timeline"),
				UIImage(named: "icon_favorites"),
				UIImage(named: "icon_bookmarks")
			],
			[
				UIImage(named: "icon_timeline"),
				UIImage(named: "icon_favorites"),
				UIImage(named: "icon_bookmarks")
			],
			[
				UIImage(named: "icon_settings"),
				UIImage(named: "icon_info")
			]
		]
	}

	override open func sideMenu(_ sideMenuController: SMCSideMenuController, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) -> Void
	{
		cell.imageView?.tintColor = UIColor
		{
			(traitCollection: UITraitCollection) -> UIColor in
			switch traitCollection.userInterfaceStyle
			{
				case .light, .unspecified: return .systemBlue
				case .dark:				return .systemRed
				@unknown default:			return .systemGreen
			}
		}
	}

	override open func sideMenu(_ sideMenuController: SMCSideMenuController, didSelectRowAt indexPath: IndexPath) -> Void
	{
		UserDefaults.standard.set(indexPath, forKey: "LaunchKey")
	}

	override open func startupIndexPath() -> IndexPath?
	{
		return UserDefaults.standard.indexPath(forKey: "LaunchKey")
	}

	override open func textColorOfHeader(in section: Int) -> UIColor?
	{
		return UIColor
		{
			(traitCollection: UITraitCollection) -> UIColor in
			switch traitCollection.userInterfaceStyle
			{
				case .light, .unspecified: return .systemBlue
				case .dark:				return .label
				@unknown default:			return .systemRed
			}
		}
	}

	override open func backgroundColorOfHeader(in section: Int) -> UIColor?
	{
		return .clear
	}
}

extension UserDefaults
{
	func indexPath(forKey key: String) -> IndexPath?
		{
		if let data = data(forKey: key), let indexPath = try? JSONDecoder().decode(IndexPath.self, from: data)
			{
			return indexPath
		}
		return nil
	}

	func set(_ indexPath: IndexPath, forKey key: String)
	{
		if let data = try? JSONEncoder().encode(indexPath)
		{
			set(data, forKey: key)
		}
	}
}
