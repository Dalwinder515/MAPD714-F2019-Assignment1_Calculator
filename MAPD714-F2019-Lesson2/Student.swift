class Student:Person
{
    var m_id:String
    
    var ID:String{
        get{
            return m_id
        }
        set{
            m_id=newValue
        }
    }
    
    
    init(_ name:String,_ age:Float,_ id:String) {
        self.m_id=id
        super.init(name: name, age: age)
    }
    
    func Studies() -> Void {
        print("\(self.m_name) is studying")
    }
}
