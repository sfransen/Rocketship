
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
        //let filename = getDocumentsDirectory().appendingPathComponent("Results.html")
        //let url = Bundle.main.url(forResource: "index", withExtension: "txt", subdirectory: "website")!
        //webView.loadFileURL(url, allowingReadAccessTo: url)
       // let request = URLRequest(url: url)
       // webView.load(request)

        let webView = WKWebView()
        webView.loadHTMLString("<html><body><p>Hello!</p></body></html>", baseURL: nil)
       // let url = URL(string: "https://www.hackingwithswift.com")!
        //webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
		self.navigationController?.navigationBar.barTintColor = .systemPurple
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
