
import UIKit
import WebKit
import MessageUI

class Results_ViewController: BaseViewController, WKNavigationDelegate, MFMailComposeViewControllerDelegate
{
	var webView: WKWebView!
 
	func sendEmail() -> (String)
	{
		if MFMailComposeViewController.canSendMail()
		{
			let mail = MFMailComposeViewController()
			mail.mailComposeDelegate = self
			mail.setToRecipients(["rentahippie@gmail.com"])
			let Subject = AppDelegate.Global_Variables.THEUSER + " - " + AppDelegate.Global_Variables.TheTitle
			mail.setSubject(Subject + " Test Results")
			let filename = getDocumentsDirectory().appendingPathComponent("Results.html")
			var text2 = ""
			
			do
			{
				text2 = try String(contentsOf: filename, encoding: .utf8)
			}
			catch
			{
				print("Failed to read from file")
			}
			let text3 = "<h1><table><tbody><tr><td>Class:</td><td><font color = 'black'>" + String(AppDelegate.Global_Variables.TheTitle) + "</font></td></tr>" +
			"<tr><td>Percentage:</td><td><font color = 'black'>" + String(AppDelegate.Global_Variables.Global_Percents) + "%" + "</font></td></tr>" +
			"<tr><td>Total:</td><td><font color = 'purple'>" + String(AppDelegate.Global_Variables.TOTAL_Count) + "</font></td></tr>" +
			"<tr><td>Correct:</td><td><font color = 'green'>" + String(AppDelegate.Global_Variables.CORRECT_Count) + "</font></td></tr>" +
			"<tr><td>Wrong:</td><td><font color = 'red'>" + String(AppDelegate.Global_Variables.WRONG_Count) + "</font></td></tr></tr></tbody></table></h1>" + text2
			mail.setMessageBody(text3, isHTML: true)
			guard let data = text3.data(using: .utf8) else { return "error" }
			mail.addAttachmentData(data, mimeType: "html", fileName: "Results.html")

			present(mail, animated: true)
		}
		else
		{
			print("Email")
			// show failure alert
		}
		return "OK"
	}

	func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?)
	{
		controller.dismiss(animated: true)
	}
	override func setup()
	{
		super.setup()

		self.title = "Results"
	}
	
	override func didReceiveMemoryWarning()
	{
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	override func loadView()
	{
		//super.viewDidLoad()
		webView = WKWebView()
		webView.navigationDelegate = self
		view = webView
		//super.loadView()
	}
	func getDocumentsDirectory() -> URL
	{
		let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		return paths[0]
	}

	override func viewDidLoad()
	{
		super.viewDidLoad()
		if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last {
			let indexURL = documentsDirectory.appendingPathComponent("Results.html")
			print(indexURL)
			self.webView.loadFileURL(indexURL, allowingReadAccessTo: indexURL)
			webView.allowsBackForwardNavigationGestures = true
			Display_Totals()
		}
		else
		{
			print("Not Found")
		}

		self.navigationController?.navigationBar.barTintColor = .systemPurple
	}
	
	func Display_Totals()
	{
		let screenSize: CGRect = UIScreen.main.bounds
		print(screenSize.height)
		let WindowLength = (self.view!.bounds.height)
		let Other = UIScreen.main.bounds.size.height
		print (WindowLength)
		print (Other)

		let Percent_label: UILabel = UILabel()
		Percent_label.frame = CGRect(x: 750, y: 80, width: 300, height: 60)
		Percent_label.backgroundColor = .clear
		Percent_label.textColor = .black
		Percent_label.textAlignment = NSTextAlignment.center
		Percent_label.text = String(AppDelegate.Global_Variables.Global_Percents) + "%"
		Percent_label.font = UIFont(name:"ChalkboardSE-Bold", size: 45.0)
		self.view.addSubview(Percent_label)

		let Total_label: UILabel = UILabel()
		Total_label.frame = CGRect(x: 5, y: 80, width: 250, height: 60)
		Total_label.backgroundColor = .clear
		Total_label.textColor = .purple
		Total_label.textAlignment = NSTextAlignment.center
		Total_label.text = String(AppDelegate.Global_Variables.TOTAL_Count) + " Total"
		Total_label.font = UIFont(name:"ChalkboardSE-Bold", size: 45.0)
		self.view.addSubview(Total_label)

		let Correct_label: UILabel = UILabel()
		Correct_label.frame = CGRect(x: 250, y: 80, width: 250, height: 60)
		Correct_label.backgroundColor = .clear
		Correct_label.textColor = .green
		Correct_label.textAlignment = NSTextAlignment.center
		Correct_label.text = String(AppDelegate.Global_Variables.CORRECT_Count) + " Correct"
		Correct_label.font = UIFont(name:"ChalkboardSE-Bold", size: 45.0)
		self.view.addSubview(Correct_label)

		let Wrong_label: UILabel = UILabel()
		Wrong_label.frame = CGRect(x: 500, y: 80, width: 250, height: 60)
		Wrong_label.backgroundColor = .clear
		Wrong_label.textColor = .red
		Wrong_label.textAlignment = NSTextAlignment.center
		Wrong_label.text = String(AppDelegate.Global_Variables.WRONG_Count) + " Wrong"
		Wrong_label.font = UIFont(name:"ChalkboardSE-Bold", size: 45.0)
		self.view.addSubview(Wrong_label)
		let hello = sendEmail()
		print( hello )
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
