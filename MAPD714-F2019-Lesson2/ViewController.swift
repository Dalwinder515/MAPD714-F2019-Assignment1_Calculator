//Dalwinder Singh
//ID: 301089722
//Description
//Date
//Version History. Vx.y:added abc (should be short)

import UIKit

class ViewController: UIViewController {
    
    private var m_operand=""
    private var m_firstValue=0.0
    private var m_secondValue=0.0
    private var m_operation=""
    private var result=0.0
    private var flag=false

    
    //var student:Student = Student("Dalwinder", 23, "12345")

    @IBOutlet weak var Resultlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Resultlabel.text="0"
        
        //student.saysHello()
        //student.Studies()
    }

    @IBAction func ClickButton(_ sender: UIButton) {
        
        var calcbutton=sender.titleLabel!.text
        
        print(calcbutton)
        
        flag=false
        
        switch(calcbutton){
        case "AC":
            m_operand="0"
            Resultlabel.text="0"
            m_firstValue=0.0
            m_secondValue=0.0
            m_operation=""
            break
        case ".":
            if(!(Resultlabel.text?.contains("."))!)
            {
                m_operand+=calcbutton!
            }
            break
        case "+", "-", "x", "÷":
            
            if(m_operand == "+" || m_operand == "-" || m_operand == "x" || m_operand == "÷")
            {
                m_operand = calcbutton!
                m_operation = find_op(value1:calcbutton!)
            }
            else
            {
                if(m_operand == "")
                {
                    m_operand = "0"
                }
                
                if(m_operation.isEmpty)
                {
                    m_firstValue=Double (m_operand) as! Double
                }
                else
                {
                    flag=true
                    m_operation = find_op(value1:calcbutton!)
                    m_secondValue=Double (m_operand) as! Double
                    m_firstValue=calc_result(value1: m_firstValue, value2: m_secondValue, op: m_operation)
                    var str = String(m_firstValue)
                    if(str.suffix(2) == ".0")
                    {
                        str = String(str.dropLast(2))
                    }
                    Resultlabel.text=String(str)
                }
                
                m_operand = calcbutton!
                m_operation = find_op(value1:calcbutton!)
            }
            break
        case "=":
            flag=true
            if(m_operation != "")
            {
                m_secondValue=Double (m_operand) as! Double
                result=calc_result(value1: m_firstValue, value2: m_secondValue, op: m_operation)
                var str = String(result)
                if(str.suffix(2) == ".0")
                {
                    str = String(str.dropLast(2))
                }
                Resultlabel.text=String(str)
                m_firstValue=result
                m_secondValue=0.0
                m_operand=""
            }
            break
        case "±":
            if(m_operand.prefix(1) == "-")
            {
                m_operand = String(m_operand.dropFirst())
            }
            else if(Resultlabel.text != "0")
            {
                m_operand = "-" + m_operand
            }
            break
        case "←":
            m_operand = String(m_operand.dropLast())
            if(m_operand.count == 0)
            {
                m_operand = "0"
            }
            break
        default:
            if(m_operand=="+"||m_operand=="-"||m_operand=="x"||m_operand=="÷"||m_operand=="0")
            {
                m_operand=""
            }
            m_operand+=calcbutton!
        }
        if(!flag)
        {
            Resultlabel.text=m_operand
        }
    }
    
    func calc_result(value1:Double, value2:Double, op:String) -> Double
    {
        if(op=="add")
        {
            return value1+value2
        }
        else if(op=="sub")
        {
            return value1-value2
        }
        else if(op=="mul")
        {
            return value1*value2
        }
        else if(op=="div")
        {
            return value1/value2
        }
        return 0.0
    }
    
    func find_op(value1:String) -> String
    {
        switch(value1)
        {
        case "+":
            return "add"
            break;
        case "-":
            return "sub"
            break;
        case "x":
            return "mul"
            break;
        case "÷":
            return "div"
            break;
        default:
            break;
        }
        return "add"
    }
}

