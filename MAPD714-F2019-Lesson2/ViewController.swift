/*
Calculator 1.1.3
 
Name: Dalwinder Singh
ID: 301089722
 
A simple basic Calculator App that works basic operations of addition, subtraction, multiplication and division.
- works with floating point numbers.
- works with negative numbers
 
Oct 1, 2019
Version History. V1.1.1 added UI
                 V1.1.2 added basic functionality
                 V1.1.3 added comments
 */

import UIKit

class ViewController: UIViewController {
    
    private var m_operand=""        //stores every number and operators
    private var m_firstValue=0.0    //stores 1st value during operations, stores result during consecutive operations
    private var m_secondValue=0.0   //stores 2nd value during operations
    private var m_operation=""      //stores the ongoing operation
    private var result=0.0          //stores result
    private var flag=false          //flag to check whether to modify ResultLabel or not



    @IBOutlet weak var Resultlabel: UILabel! //Result Label
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Resultlabel.text="0"  //Set ResultLabel to 0 on app start
        
    }

    //Function ClickButton. called when any button on screen is clicked. Clicked Button is received in UIButton
    @IBAction func ClickButton(_ sender: UIButton) {
        
        var calcbutton=sender.titleLabel!.text  //calcbutton stores text of sender
        
        print(calcbutton)
        
        flag=false
        
        //switch for calcbutton text
        switch(calcbutton){
        //case All Clear: Select everything to nil
        case "AC":
            m_operand="0"
            Resultlabel.text="0"
            m_firstValue=0.0
            m_secondValue=0.0
            m_operation=""
            break
        
        //case Dot/Decimal point(.)
        case ".":
            //if ResultLabel already has a decimal, do nothing
            if(!(Resultlabel.text?.contains("."))!)
            {
                m_operand+=calcbutton!
            }
            break
            
        //case operators
        case "+", "-", "x", "÷":
            
            //if user presses operators consecutively, change to the last pressed one
            if(m_operand == "+" || m_operand == "-" || m_operand == "x" || m_operand == "÷")
            {
                m_operand = calcbutton!
                m_operation = find_op(value1:calcbutton!)
            }
                
            else
            {
                //if no operand was entered, set operand = 0
                if(m_operand == "")
                {
                    m_operand = "0"
                }
                
                //if no operation is ongoing, this is the first value
                if(m_operation.isEmpty)
                {
                    m_firstValue=Double (m_operand) as! Double  //string to double conversion
                }
                    
                //else, an operation is ongoing, this is the second value
                else
                {
                    flag=true
                    m_operation = find_op(value1:calcbutton!)  //find operation from operator
                    m_secondValue=Double (m_operand) as! Double
                    
                    //call calculate function and assign the result to first value
                    m_firstValue=calc_result(value1: m_firstValue, value2: m_secondValue, op: m_operation)
                    
                    //convert to String and remove the decimal followed by 0 if result is an integer
                    var str = String(m_firstValue)
                    if(str.suffix(2) == ".0")
                    {
                        str = String(str.dropLast(2))
                    }
                    Resultlabel.text=String(str)
                }
                
                //for if(operation empty) block, we still need to assign operator and operation
                m_operand = calcbutton!
                m_operation = find_op(value1:calcbutton!)
                
                }
            break
        
        //equals operation, set flag and call calculate function to get result
        case "=":
            flag=true
            
            if(m_operation != "")
            {
                m_secondValue=Double (m_operand) as! Double
                
                //skip if divide by zero
                if(!(m_operation == "div" && m_secondValue == 0.0)){
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
            }
            break
            
        //positive/negative operator
        case "±":
            //if first character is '-', drop it
            if(m_operand.prefix(1) == "-")
            {
                m_operand = String(m_operand.dropFirst())
            }
            //else if ResultLabel is non zero, add a '-' prefix
            else if(Resultlabel.text != "0")
            {
                m_operand = "-" + m_operand
            }
            break
            
        //back function. clears last entered character. sets to 0 if everything is cleared
        case "←":
            m_operand = String(m_operand.dropLast())
            if(m_operand.count == 0)
            {
                m_operand = "0"
            }
            break
            
        //default case, all numbers are added into m_operand here
        default:
            //to remove double operators on screen
            if(m_operand=="+"||m_operand=="-"||m_operand=="x"||m_operand=="÷"||m_operand=="0")
            {
                m_operand=""
            }
            m_operand+=calcbutton!
        }
        
        //flag for equals function, don't modify ResultLabel when equals was pressed
        if(!flag)
        {
            Resultlabel.text=m_operand
        }
    }
    
    //function calculate result(): performs all 4 basic operations and returns a double value
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
    
    //function find operation(): returns String operation for corresponding operator
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

