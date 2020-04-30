import Foundation

public protocol RegisterWorkerProtocol {
    func register(username: String, password: String) -> String
}

public class RegisterWorker: RegisterWorkerProtocol {
    
    public init() {
        
    }
    
    public func register(username: String, password: String) -> String{
        return "registered fake"
    }
}
