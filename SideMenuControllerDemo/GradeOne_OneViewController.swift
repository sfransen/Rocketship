
import UIKit

class GradeOne_OneViewController: BaseViewController
{
	override func setup() {
		super.setup()

		self.title = "Grade 1 Additions"
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	override func loadView() {
		super.loadView()
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		self.navigationController?.navigationBar.barTintColor = .systemIndigo
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
	}
}