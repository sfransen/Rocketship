import UIKit

class GradeOne_TwoViewController: BaseViewController
{
	override func setup()
    {
		super.setup()

		self.title = "Grade 1 Subtraction"
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
        self.view.backgroundColor = .lightGray
        assignbackground()
        
		self.navigationController?.navigationBar.barTintColor = .systemPink
        super.viewDidLoad()

        let ViewTitle: UILabel = UILabel()
        ViewTitle.frame = CGRect(x: 150, y: 20, width: 500, height: 50)
        ViewTitle.backgroundColor = .clear
        ViewTitle.textColor = .black
        ViewTitle.textAlignment = NSTextAlignment.center
        ViewTitle.backgroundColor = .clear
        ViewTitle.textColor = .black
        ViewTitle.textAlignment = NSTextAlignment.center
        ViewTitle.text = "Order of Operations"
        ViewTitle.font = UIFont(name:"Optima-Bold", size: 50.0)
        self.view.addSubview(ViewTitle)

        
        let button1 = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button1.backgroundColor = .yellow
        button1.setTitle("96", for: .normal)
        button1.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button1.setTitleColor(.black, for: .normal)
        button1.layer.cornerRadius = 5
        button1.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.black.cgColor
        
        self.view.addSubview(button1)

        let button2 = UIButton(frame: CGRect(x: 100, y: 200, width: 100, height: 50))
        button2.backgroundColor = .yellow
        button2.setTitle("95", for: .normal)
        button2.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button2.setTitleColor(.black, for: .normal)
        button2.layer.cornerRadius = 5
        button2.layer.borderWidth = 1
        button2.layer.borderColor = UIColor.black.cgColor
        self.view.addSubview(button2)

        let button3 = UIButton(frame: CGRect(x: 100, y: 300, width: 100, height: 50))
        button3.backgroundColor = .yellow
        button3.setTitle("152", for: .normal)
        button3.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button3.setTitleColor(.black, for: .normal)
        button3.layer.cornerRadius = 5
        button3.layer.borderWidth = 1
        button3.layer.borderColor = UIColor.black.cgColor
        self.view.addSubview(button3)

        let button4 = UIButton(frame: CGRect(x: 100, y: 400, width: 100, height: 50))
        button4.backgroundColor = .yellow
        button4.setTitle("104", for: .normal)
        button4.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button4.setTitleColor(.black, for: .normal)
        button4.layer.cornerRadius = 5
        button4.layer.borderWidth = 1
        button4.layer.borderColor = UIColor.black.cgColor
        self.view.addSubview(button4)

        let label: UILabel = UILabel()
        label.frame = CGRect(x: 300, y: 100, width: 300, height: 50)
        label.backgroundColor = .clear
        label.textColor = .black
        label.textAlignment = NSTextAlignment.center
        label.text = "3 + 5 x 20 - 8 = ?"
        label.font = UIFont(name:"Optima-Bold", size: 40.0)
        self.view.addSubview(label)

        let label1: UILabel = UILabel()
        label1.frame = CGRect(x: 300, y: 300, width: 300, height: 50)
        label1.backgroundColor = .clear
        label1.textColor = .black
        label1.textAlignment = NSTextAlignment.center
        label1.text = "test label"
        label1.backgroundColor = .clear
        label1.textColor = .black
        label1.textAlignment = NSTextAlignment.center
        label1.text = "ANSWER"
        label1.font = UIFont(name:"Optima-Bold", size: 40.0)
        self.view.addSubview(label1)

        //let txtField: UITextField = UITextField()
        //txtField.frame = CGRect(x: 450, y: 400, width: 100, height: 50)
        //txtField.backgroundColor = .systemPink
        //self.view.addSubview(txtField)

	}

    override func viewWillAppear(_ animated: Bool)
    {
		super.viewWillAppear(animated)
	}

	override func viewDidAppear(_ animated: Bool)
    {
		super.viewDidAppear(animated)
	}

    @objc func buttonAction(sender: UIButton!)
    {
        print("Button tapped")
    }
    func assignbackground()
    {
            let background = UIImage(named: "lackboard2-landscale.png")

            var imageView : UIImageView!
            imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = background
            imageView.center = view.center
            view.addSubview(imageView)
            self.view.sendSubviewToBack(imageView)
        }
}

