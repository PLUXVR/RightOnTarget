import Foundation


/**
 Сущность "Раунд"
 */


protocol GameRoundProtocol {
    //количество заработанных очков
    var score : Int { get }
    //загаданное значение
    var currentSecretValue : Int { get }
    //сравнение переданного значения с загаданным числом и начисление очков
    func calculateScore (with value : Int)
}

class GameRound : GameRoundProtocol {
    
    var score: Int = 0
    
    var currentSecretValue: Int = 0
    
    init(secretValue: Int) {
        currentSecretValue = secretValue
    }
    
    //посчитать количество очков
    func calculateScore(with value: Int) {
        if value > currentSecretValue {
            score += 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            score += 50 - currentSecretValue + value
        } else {
            score += 50
        }        
    }
}
