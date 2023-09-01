import Foundation

protocol GeneratorProtocol {
    
    func getRandomValue() -> Int
    
}


class Generator: GeneratorProtocol {
    
    func getRandomValue() -> Int {
        Int(arc4random_uniform(UInt32(50)))
    }
    
}
