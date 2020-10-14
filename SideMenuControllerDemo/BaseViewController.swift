
import Foundation
import UIKit

class BaseViewController: UIViewController
{
	public internal(set) var app: AppDelegate = UIApplication.shared.delegate as! AppDelegate

	required init(coder aDecoder: NSCoder) {
		fatalError("NSCoding not supported")
	}

	init() {
		super.init(nibName: nil, bundle: nil)
		setup()
	}

	override func loadView() {
		super.loadView()

		self.edgesForExtendedLayout = []
		self.extendedLayoutIncludesOpaqueBars = true

		self.view.backgroundColor = .white
		self.view.autoresizesSubviews = true
		self.view.autoresizingMask	= [ .flexibleWidth, .flexibleHeight ]
	}

	func setup() {
		// actual contents of init(). subclass can override this.
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.

		if self.isModal {
			let closeItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(handleCloseAction))
			self.navigationItem.leftBarButtonItem = closeItem
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}

extension BaseViewController
{
	var isModal: Bool {
		if let viewControllers = self.navigationController?.viewControllers,
			 let rootViewController = viewControllers.first {
			return rootViewController == self && rootViewController.presentingViewController != nil
		}
		return false
	}

	@objc func handleCloseAction(_ sender: UIBarButtonItem) {
		self.dismiss(animated: true, completion: nil)
	}
}

extension BaseViewController
{
	public func popup(title: String, message: String) {
		autoreleasepool {
			let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
			alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
			self.present(alertController, animated: true, completion: nil)
		}
	}

	public func showModal(_ viewController: UIViewController, animated: Bool, completion: (()->Void)? = nil) {
		let navigationController = UINavigationController(rootViewController: viewController)
		if let parentNavigationController = self.navigationController {
			parentNavigationController.present(navigationController, animated: true, completion: completion)
		}
		else {
			self.present(navigationController, animated: true, completion: completion)
		}
	}
}
