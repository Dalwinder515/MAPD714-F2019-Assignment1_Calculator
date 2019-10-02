
class Person
{
    var m_name:String
    var m_age:Float
    
    var Name:String{
        get{
            return m_name
        }
        set{
            m_name=newValue
        }
    }
    var Age:Float{
        get{
            return m_age
        }
        set{
            m_age=newValue
        }
    }
    
    init(name:String, age:Float) {
        self.m_name=name
        self.m_age=age
    }
    
    func saysHello() -> Void {
        print("\(self.m_name) says Hello")
    }
}

