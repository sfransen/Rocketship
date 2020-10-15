
import UIKit

extension String
{
    mutating func addString(str: String)
    {
        self = self + str
    }
}

func RandomNumber() -> (String)
{
    let numberOne = Int.random(in: 1..<20)
    var str1 = "";
    str1 = String(numberOne)
    //print(str2)
    return str1
}

func RandomQuestion2() -> (String, String, String, String, String, Bool, Bool, Bool, Bool, String)
{
    let numberOne = Int.random(in: 1..<20)
    let numberTwo = Int.random(in: 1..<20)
    let numberThree : Int = numberOne - 1
    let numberFour : Int = numberOne + 1
    let numberFive : Int = numberTwo + 2
    let multi = " + "
    
    var str1 = "";
    str1.addString(str: String(numberOne))
    str1.addString(str: multi)
    str1.addString(str: String(numberTwo))
    str1.addString(str: " = ?")
    let TheQuestion = str1
    print(TheQuestion)
    
    let TheAnwser : Int = numberOne + numberTwo
    let TheBadOne : Int = numberThree + numberOne + 2
    let TheBadTwo : Int = numberFour + numberOne + 3
    let TheBadThree : Int = numberFive + numberOne + 4
    let str2 = String(TheAnwser)
    let str3 = String(TheBadOne)
    let str4 = String(TheBadTwo)
    let str5 = String(TheBadThree)
 
    print("str2: " + str2)
    print("str3: " + str3)
    print("str4: " + str4)
    print("str5: " + str5)
 
    let THELOCATION_INDEX = Int.random(in: 1..<4)
    print("THELOCATION_INDEX: " + String(THELOCATION_INDEX))
    switch THELOCATION_INDEX
    {
        case 1:
            return (TheQuestion, str2, str3, str4, str5, true, false, false, false, str2)
        case 2:
            return (TheQuestion, str3, str2, str4, str5, false, true, false, false, str2)
        case 3:
            return (TheQuestion, str3, str4, str2, str5, false, false, true, false, str2)
        case 4:
            return (TheQuestion, str3, str4, str5, str2, false, false, false, true, str2)
        default:
            return (TheQuestion, str5, str3, str4, str2, false, false, false, true, str2)
    }
}

func RandomQuestion() -> (String, String)
{
    let numberOne = Int.random(in: 1..<20)
    let numberTwo = Int.random(in: 1..<20)
    let multi = " * "
    var str1 = "";
    
    str1.addString(str: String(numberOne))
    str1.addString(str: multi)
    str1.addString(str: String(numberTwo))
    str1.addString(str: " = ?")
    let TheQuestion = str1
   // print(TheQuestion)
    let TheAnwser : Int = numberOne * numberTwo
    let str2 = String(TheAnwser)
    //print(str2)
    return (TheQuestion, str2)
}

class GradeOne_OneViewController: BaseViewController
{
    struct MyVariables
    {
        static var yourVariable = "someString"
    }
    override func setup()
	{
		super.setup()

		self.title = "Grade 1 Additions"
	}
    func removeSubview()
    {
        print("Start remove sibview")
        
        if let viewWithTag = self.view.viewWithTag(100)
        {
            viewWithTag.removeFromSuperview()
        }
        else
        {
            print("No!")
        }
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
    func Create_New_Problem() -> (String)
    {
        let THISDATA = RandomQuestion2()
        let TheQuestion = THISDATA.0
        let ButtonOneName = THISDATA.1
        let ButtonTwoName = THISDATA.2
        let ButtonThreeName = THISDATA.3
        let ButtonFourName = THISDATA.4
        let REALAnswer = THISDATA.9
        print(TheQuestion)

        let ViewTitle: UILabel = UILabel()
        ViewTitle.frame = CGRect(x: 150, y: 20, width: 500, height: 50)
        ViewTitle.backgroundColor = .clear
        ViewTitle.textColor = .black
        ViewTitle.textAlignment = NSTextAlignment.center
        ViewTitle.backgroundColor = .clear
        ViewTitle.textColor = .black
        ViewTitle.textAlignment = NSTextAlignment.center
        ViewTitle.text = "Additions Problems"
        ViewTitle.font = UIFont(name:"ChalkboardSE-Bold", size: 50.0)
        self.view.addSubview(ViewTitle)

        let button1 = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button1.backgroundColor = .yellow
        button1.setTitle(ButtonOneName, for: .normal)
        button1.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button1.setTitleColor(.black, for: .normal)
        button1.layer.cornerRadius = 5
        button1.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.black.cgColor

        self.view.addSubview(button1)

        let button2 = UIButton(frame: CGRect(x: 100, y: 200, width: 100, height: 50))
        button2.backgroundColor = .yellow
        button2.setTitle(ButtonTwoName, for: .normal)
        button2.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button2.setTitleColor(.black, for: .normal)
        button2.layer.cornerRadius = 5
        button2.layer.borderWidth = 1
        button2.layer.borderColor = UIColor.black.cgColor
        self.view.addSubview(button2)

        let button3 = UIButton(frame: CGRect(x: 100, y: 300, width: 100, height: 50))
        button3.backgroundColor = .yellow
        button3.setTitle(ButtonThreeName, for: .normal)
        button3.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button3.setTitleColor(.black, for: .normal)
        button3.layer.cornerRadius = 5
        button3.layer.borderWidth = 1
        button3.layer.borderColor = UIColor.black.cgColor
        self.view.addSubview(button3)

        let button4 = UIButton(frame: CGRect(x: 100, y: 400, width: 100, height: 50))
        button4.backgroundColor = .yellow
        button4.setTitle(ButtonFourName, for: .normal)
        button4.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button4.setTitleColor(.black, for: .normal)
        button4.layer.cornerRadius = 5
        button4.layer.borderWidth = 1
        button4.layer.borderColor = UIColor.black.cgColor
        self.view.addSubview(button4)

        let label: UILabel = UILabel()
        label.frame = CGRect(x: 300, y: 100, width: 400, height: 70)
        label.backgroundColor = .clear
        label.textColor = .black
        label.textAlignment = NSTextAlignment.center
        label.text = TheQuestion
        label.font = UIFont(name:"ChalkboardSE-Bold", size: 60.0)
        self.view.addSubview(label)
        
        let label1: UILabel = UILabel()
        label1.frame = CGRect(x: 300, y: 300, width: 300, height: 70)
        label1.backgroundColor = .clear
        label1.textColor = .black
        label1.textAlignment = NSTextAlignment.center
        label1.text = "test label"
        label1.backgroundColor = .clear
        label1.textColor = .black
        label1.textAlignment = NSTextAlignment.center
        label1.text = "Running Totals"
        label1.font = UIFont(name:"ChalkboardSE-Bold", size: 40.0)
        self.view.addSubview(label1)

        MyVariables.yourVariable = REALAnswer
        return REALAnswer
    }
	override func viewDidLoad()
	{
		super.viewDidLoad()
		self.view.backgroundColor = .lightGray
		//assignbackground()

        let globalString = "I'm global!"
        print(globalString)

		self.navigationController?.navigationBar.barTintColor = .systemPink
		super.viewDidLoad()
        
        let MyAnswer = Create_New_Problem()
        print(MyAnswer)

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
        let buttonTitle = sender.titleLabel?.text
        print( buttonTitle!)
        print("Button tapped")
        let string = MyVariables.yourVariable
        
        print("Global variable:\(string)")
        for subview in self.view.subviews
        {
            subview.removeFromSuperview()
        }
        if ( string == buttonTitle)
        {
            print("Correct")
            Correct()
        }
        else
        {
            print("WRONG!")
            Wrong()
        }
        let TheNewAnswer = Create_New_Problem()
        print(TheNewAnswer)
	}
    func Correct()
    {
        let correct: UILabel = UILabel()
        correct.frame = CGRect(x: 300, y: 400, width: 400, height: 100)
        correct.backgroundColor = .clear
        correct.textColor = .green
        correct.textAlignment = NSTextAlignment.center
        correct.text = "Correct"
        correct.font = UIFont(name:"ChalkboardSE-Bold", size: 70.0)
        self.view.addSubview(correct)
    }
    func Wrong()
    {
        let wrong: UILabel = UILabel()
        wrong.frame = CGRect(x: 300, y: 400, width: 400, height: 100)
        wrong.backgroundColor = .clear
        wrong.textColor = .red
        wrong.textAlignment = NSTextAlignment.center
        wrong.text = "Wrong"
        wrong.font = UIFont(name:"ChalkboardSE-Bold", size: 70.0)
        self.view.addSubview(wrong)
    }
	func assignbackground()
	{
			let background = UIImage(named: "blackboard2-landscale.png")

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

