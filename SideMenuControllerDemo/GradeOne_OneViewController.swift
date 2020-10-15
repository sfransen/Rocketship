
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
    let TheAnwser : Int = numberOne * numberTwo
    let str2 = String(TheAnwser)
    return (TheQuestion, str2)
}

class GradeOne_OneViewController: BaseViewController
{
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
        var TheBadOne : Int = numberThree + numberOne + 2
        var TheBadTwo : Int = numberFour + numberOne + 3
        var TheBadThree : Int = numberFive + numberOne + 4

        if ( TheAnwser == TheBadOne )
        {
            TheBadOne = numberThree + numberTwo
        }
        if ( TheAnwser == TheBadTwo )
        {
            TheBadTwo = numberFour + numberOne + 2
        }
        if ( TheAnwser == TheBadThree )
        {
            TheBadThree = numberFive + numberOne + 2
        }
        let str2 = String(TheAnwser)
        let str3 = String(TheBadOne)
        let str4 = String(TheBadTwo)
        let str5 = String(TheBadThree)

        print("str2: " + str2)
        print("str3: " + str3)
        print("str4: " + str4)
        print("str5: " + str5)

        Global_Variables.Global_Question = TheQuestion

        let THELOCATION_INDEX = Int.random(in: 1..<5)
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
    func getDocumentsDirectory() -> URL
    {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    func Append_To_File()
    {
        var TheString = ""
        if ( Global_Variables.Global_WrongAnswer == "" )
        {
        	TheString = "<font color = 'green'>" + String(Global_Variables.Global_Correct_Answer)
        }
        else
        {
        	TheString = "<font color = 'red'>" + String(Global_Variables.Global_WrongAnswer)
        }

        let str = "<tr><th>" + String(Global_Variables.TOTAL_Count) + "</th><th>" + String(Global_Variables.Global_Question) + "</th><th>" + String(Global_Variables.Global_Correct_Answer) + "</th><th>" +  TheString + "</font></th></tr>\n"
        let data = Data(str.utf8)
        let filename = getDocumentsDirectory().appendingPathComponent("Results.txt")

        if let fileHandle = FileHandle(forWritingAtPath: filename.path)
        {
            fileHandle.seekToEndOfFile()
            fileHandle.write(data)
        }
    }
    func End_of_Table()
    {
        let numberGlobal : Int = Global_Variables.TOTAL_Count
        let numberCorrect : Int = Global_Variables.COREECT_Count
        let PercentIS : Int = numberCorrect / numberGlobal
        let TheTable = "<thead></table>"
        let Last_Row = "<center><h1>Total Problems: <font = color = 'purple'>" + String(Global_Variables.TOTAL_Count) + "</font><br>Correct Numbers: <font = color = 'green'>" + String(Global_Variables.COREECT_Count) + "</font><br>Wrong Numbers: <font = color = 'red'>" + String(Global_Variables.WRONG_Count) + "</font><br>Percent: <font = color = 'brown'>" + String(PercentIS) + "%</font></h1></center>\n"
        let THEEND = "<thead></table><html>\n"
        let THEENDING = TheTable + Last_Row + THEEND

        let data = Data(THEENDING.utf8)
        let filename = getDocumentsDirectory().appendingPathComponent("Results.txt")

        if let fileHandle = FileHandle(forWritingAtPath: filename.path)
        {
            fileHandle.seekToEndOfFile()
            fileHandle.write(data)
        }
    }
    func Read_To_File()
    {
        let filename = getDocumentsDirectory().appendingPathComponent("Results.txt")

        do
        {
            let text2 = try String(contentsOf: filename, encoding: .utf8)

            print(text2)
        }
        catch
        {
            print("Failed to read from file")
        }
    }
    func WriteTableHeader()
    {
        let filename = getDocumentsDirectory().appendingPathComponent("Results.txt")
        do
        {
            let str = "<html><head><title>" + Global_Variables.THEUSER + " " + Global_Variables.TheTitle + "</title></head><body><center><h1>"
            let str2 = Global_Variables.THEUSER + " " + Global_Variables.TheTitle + "</h1></center>\n<table style='width: 80%;' border='4' cellpadding='4'><tbody>\n<tr><th><b>#</b></th><th><b>Question</b></th><th><b>Correct Answer</b></th><th><b>Selected Answer</b></th></tr>\n"
            let str3 = str + str2
            try str3.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
        }
        catch
        {
            print("Failed to write to WriteTableHeader file")
        }
    }
    struct Global_Variables
    {
        static var Global_Question = ""
        static var Global_WrongAnswer = ""
        static var Global_Correct_Answer = ""
        static var COREECT_Count = 0
        static var WRONG_Count = 0
        static var TOTAL_Count = 0
        static var THEUSER = "Aila Fransen"
        static var TheTitle = "Grade 1 Additions"
    }

    func Add_Image()
    {
        let screenSize: CGRect = UIScreen.main.bounds
        print(screenSize.height)
        let WindowLength = screenSize.height
        let imageName = "logo.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)

        if ( WindowLength == 540 )
        {
            imageView.frame = CGRect(x: 200, y:900, width: 596, height: 252)
        }
        else if ( WindowLength == 1366 )
        {
            imageView.frame = CGRect(x: 200, y:850, width: 596, height: 252)
        }
        else
        {
            imageView.frame = CGRect(x: 150, y:790, width: 596, height: 252)
        }

        self.view.addSubview(imageView)

        //Imageview on Top of View
        self.view.bringSubviewToFront(imageView)
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
    func Create_Total_Label()
    {
        let total_label: UILabel = UILabel()
        total_label.frame = CGRect(x: 600, y: 600, width: 200, height: 70)
        total_label.backgroundColor = .clear
        total_label.textColor = .blue
        total_label.textAlignment = NSTextAlignment.center
        total_label.text = String(Global_Variables.TOTAL_Count)
        total_label.font = UIFont(name:"ChalkboardSE-Bold", size: 60.0)
        self.view.addSubview(total_label)

        let imageName = "Pound.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 660, y: 520, width: 60, height: 60)
        self.view.addSubview(imageView)
    }
    func Create_Correct_Label()
    {
        let Correct_label: UILabel = UILabel()
        Correct_label.frame = CGRect(x: 400, y: 600, width: 200, height: 70)
        Correct_label.backgroundColor = .clear
        Correct_label.textColor = .green
        Correct_label.textAlignment = NSTextAlignment.center
        Correct_label.text = String(Global_Variables.COREECT_Count)
        Correct_label.font = UIFont(name:"ChalkboardSE-Bold", size: 60.0)
        self.view.addSubview(Correct_label)

        let imageName = "checkmark.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 480, y: 520, width: 60, height: 60)
        self.view.addSubview(imageView)

    }
    func Create_Wrong_Label()
    {
        let Wrong_label: UILabel = UILabel()
        Wrong_label.frame = CGRect(x: 200, y: 600, width: 200, height: 70)
        Wrong_label.backgroundColor = .clear
        Wrong_label.textColor = .red
        Wrong_label.textAlignment = NSTextAlignment.center
        Wrong_label.text = String(Global_Variables.WRONG_Count)
        Wrong_label.font = UIFont(name:"ChalkboardSE-Bold", size: 60.0)
        self.view.addSubview(Wrong_label)

        let imageName = "X.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 280, y: 520, width: 60, height: 60)
        self.view.addSubview(imageView)
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
        ViewTitle.frame = CGRect(x: 250, y: 20, width: 500, height: 50)
        ViewTitle.backgroundColor = .clear
        ViewTitle.textAlignment = NSTextAlignment.center
        ViewTitle.backgroundColor = .clear
        ViewTitle.textColor = .white
        ViewTitle.textAlignment = NSTextAlignment.center
        ViewTitle.text = "Additions Problems"
        ViewTitle.font = UIFont(name:"ChalkboardSE-Bold", size: 50.0)
        self.view.addSubview(ViewTitle)

        let button1 = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button1.backgroundColor = .yellow
        button1.setTitle(ButtonOneName, for: .normal)
        button1.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button1.setTitleColor(.purple, for: .normal)
        button1.layer.cornerRadius = 5
        button1.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.red.cgColor
        button1.titleLabel?.font =  UIFont(name: "ChalkboardSE-Bold", size: 40)
        self.view.addSubview(button1)

        let button2 = UIButton(frame: CGRect(x: 100, y: 200, width: 100, height: 50))
        button2.backgroundColor = .yellow
        button2.setTitle(ButtonTwoName, for: .normal)
        button2.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button2.setTitleColor(.purple, for: .normal)
        button2.layer.cornerRadius = 5
        button2.layer.borderWidth = 1
        button2.layer.borderColor = UIColor.red.cgColor
        button2.titleLabel?.font =  UIFont(name: "ChalkboardSE-Bold", size: 40)
        self.view.addSubview(button2)

        let button3 = UIButton(frame: CGRect(x: 100, y: 300, width: 100, height: 50))
        button3.backgroundColor = .yellow
        button3.setTitle(ButtonThreeName, for: .normal)
        button3.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button3.setTitleColor(.purple, for: .normal)
        button3.layer.cornerRadius = 5
        button3.layer.borderWidth = 1
        button3.layer.borderColor = UIColor.red.cgColor
        button3.titleLabel?.font =  UIFont(name: "ChalkboardSE-Bold", size: 40)
        self.view.addSubview(button3)

        let button4 = UIButton(frame: CGRect(x: 100, y: 400, width: 100, height: 50))
        button4.backgroundColor = .yellow
        button4.setTitle(ButtonFourName, for: .normal)
        button4.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button4.setTitleColor(.purple, for: .normal)
        button4.layer.cornerRadius = 5
        button4.layer.borderWidth = 1
        button4.layer.borderColor = UIColor.red.cgColor
        button4.titleLabel?.font =  UIFont(name: "ChalkboardSE-Bold", size: 40)
        self.view.addSubview(button4)

        let label: UILabel = UILabel()
        label.frame = CGRect(x: 300, y: 100, width: 400, height: 70)
        label.backgroundColor = .clear
        label.textColor = .white
        label.textAlignment = NSTextAlignment.center
        label.text = TheQuestion
        label.font = UIFont(name:"ChalkboardSE-Bold", size: 60.0)
        self.view.addSubview(label)

        let label1: UILabel = UILabel()
        label1.frame = CGRect(x: 350, y: 400, width: 300, height: 70)
        label1.backgroundColor = .clear
        label1.textAlignment = NSTextAlignment.center
        label1.backgroundColor = .clear
        label1.textColor = .white
        label1.textAlignment = NSTextAlignment.center
        label1.text = "Running Totals"
        label1.font = UIFont(name:"ChalkboardSE-Bold", size: 40.0)
        self.view.addSubview(label1)

        Global_Variables.Global_Correct_Answer = REALAnswer
        Add_Image()
        Create_Total_Label()
        Create_Correct_Label()
        Create_Wrong_Label()

        return REALAnswer
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //self.view.backgroundColor = .lightGray
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"blackboard2-landscale.png")!)

        Add_Image()
        WriteTableHeader()
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
        let string = Global_Variables.Global_Correct_Answer

        print("Global variable:\(string)")
        for subview in self.view.subviews
        {
            subview.removeFromSuperview()
        }
        if ( string == buttonTitle)
        {
            print("Correct")
            Correct()
            let TheNewCorrect_Number : Int = Global_Variables.COREECT_Count + 1
            Global_Variables.COREECT_Count = TheNewCorrect_Number
            Global_Variables.Global_WrongAnswer = ""
        }
        else
        {
            print("WRONG!")
            Wrong()
            Global_Variables.Global_WrongAnswer = buttonTitle!
            let TheNewWrong_Number : Int = Global_Variables.WRONG_Count + 1
            Global_Variables.WRONG_Count = TheNewWrong_Number
        }

        let TheNewTOTAL_Number : Int = Global_Variables.TOTAL_Count + 1
        Global_Variables.TOTAL_Count = TheNewTOTAL_Number

        Append_To_File()
        let TheNewAnswer = Create_New_Problem()
        print(TheNewAnswer)
    }

    func PLACECorrectAnswer()
    {
        let correct: UILabel = UILabel()
        correct.frame = CGRect(x: 300, y: 200, width: 400, height: 100)
        correct.backgroundColor = .clear
        correct.textColor = .green
        correct.textAlignment = NSTextAlignment.center
        correct.text = Global_Variables.Global_Correct_Answer
        correct.font = UIFont(name:"ChalkboardSE-Bold", size: 70.0)
        self.view.addSubview(correct)
    }
    func Correct()
    {
        let correct: UILabel = UILabel()
        correct.frame = CGRect(x: 300, y: 300, width: 400, height: 100)
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
        wrong.frame = CGRect(x: 300, y: 300, width: 400, height: 100)
        wrong.backgroundColor = .clear
        wrong.textColor = .red
        wrong.textAlignment = NSTextAlignment.center
        wrong.text = "Wrong"
        wrong.font = UIFont(name:"ChalkboardSE-Bold", size: 70.0)
        self.view.addSubview(wrong)
        PLACECorrectAnswer()
   }
}

