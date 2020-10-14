
import UIKit

class Settings_ViewController: BaseViewController
{
	override func setup()
	{
		super.setup()

		self.title = "Settings"
	}

	override func didReceiveMemoryWarning()
	{
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	override func loadView()
	{
		super.loadView()
	}

	override func viewDidLoad()
	{
		super.viewDidLoad()

		self.navigationController?.navigationBar.barTintColor = .systemOrange
	}

	override func viewWillAppear(_ animated: Bool)
	{
		super.viewWillAppear(animated)
	}

	override func viewDidAppear(_ animated: Bool)
	{
		super.viewDidAppear(animated)
	}
}
