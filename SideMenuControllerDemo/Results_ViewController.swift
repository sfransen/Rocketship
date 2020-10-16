
import UIKit
import WebKit


class Results_ViewController: BaseViewController, WKNavigationDelegate
{
    var webView: WKWebView!

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
        Percent_label.text = String(GradeOne_OneViewController.Global_Variables.Global_Percents) + "%"
        Percent_label.font = UIFont(name:"ChalkboardSE-Bold", size: 45.0)
        self.view.addSubview(Percent_label)

        let Total_label: UILabel = UILabel()
        Total_label.frame = CGRect(x: 5, y: 80, width: 250, height: 60)
        Total_label.backgroundColor = .clear
        Total_label.textColor = .purple
        Total_label.textAlignment = NSTextAlignment.center
        Total_label.text = String(GradeOne_OneViewController.Global_Variables.TOTAL_Count) + " Total"
        Total_label.font = UIFont(name:"ChalkboardSE-Bold", size: 45.0)
        self.view.addSubview(Total_label)

        let Correct_label: UILabel = UILabel()
        Correct_label.frame = CGRect(x: 250, y: 80, width: 250, height: 60)
        Correct_label.backgroundColor = .clear
        Correct_label.textColor = .green
        Correct_label.textAlignment = NSTextAlignment.center
        Correct_label.text = String(GradeOne_OneViewController.Global_Variables.CORRECT_Count) + " Correct"
        Correct_label.font = UIFont(name:"ChalkboardSE-Bold", size: 45.0)
        self.view.addSubview(Correct_label)

        let Wrong_label: UILabel = UILabel()
        Wrong_label.frame = CGRect(x: 500, y: 80, width: 250, height: 60)
        Wrong_label.backgroundColor = .clear
        Wrong_label.textColor = .red
        Wrong_label.textAlignment = NSTextAlignment.center
        Wrong_label.text = String(GradeOne_OneViewController.Global_Variables.WRONG_Count) + " Wrong"
        Wrong_label.font = UIFont(name:"ChalkboardSE-Bold", size: 45.0)
        self.view.addSubview(Wrong_label)
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
