import Foundation

protocol GameProtocol {
       // текущий раунд
       var currentRound: GameRoundProtocol! { get }
       // Проверяет, окончена ли игра
       var isGameEnded: Bool { get }
       // Генератор случайного значения
       var secretValueGenerator: GeneratorProtocol { get }
       // Начинает новую игру и сразу стартует первый раунд
       func restartGame()
       // Начинает новый раунд
       func startNewRound()
}

class Game : GameProtocol {
    
    var currentRound: GameRoundProtocol!
    
    //количество раундов
    var lastRound : Int = 0 //
    var currentRoundCount : Int = 0 //
    
    var secretValueGenerator: GeneratorProtocol //
    
    //вычисляемое свойство "если текущий раунд больше или равно последнему раунду вернуть true, если нет - false"
    
    var isGameEnded: Bool {
        if currentRoundCount >= lastRound {
            return true
        } else {
            return false
        }
    }
    //инициализатор класса? (минимальное и максимальное значения, количество раундов, сгенерировать случайное число)
    init(valueGenerator: GeneratorProtocol, rounds: Int) {
        secretValueGenerator = valueGenerator
        lastRound = rounds
        startNewRound()
    }
    
    //начать игру заново
    func restartGame() {
        currentRoundCount = 0
        startNewRound()
    }
    //начать игру
    func startNewRound() {
        currentRoundCount += 1
        let newSecretValue = self.getNewSecretValue()
        currentRound = GameRound(secretValue: newSecretValue)
    }
    
        private func getNewSecretValue() -> Int {
            return secretValueGenerator.getRandomValue()
        }
}
