import Foundation

protocol GameProtocol {
    // Количество заработанных очков
    var score: Int { get }
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
    
    var score: Int {
        var totalScore: Int = 0
        for round in self.rounds {
            totalScore += round.score
        }
        return totalScore
    }
    var currentRound: GameRoundProtocol!
    private var rounds: [GameRoundProtocol] = []
    var secretValueGenerator: GeneratorProtocol
    private var roundsCount: Int!
    var isGameEnded: Bool {
        if roundsCount == rounds.count {
            return true
        } else {
            return false
        }
    }
    
    //инициализатор класса? (минимальное и максимальное значения, количество раундов, сгенерировать случайное число)
    init(valueGenerator: GeneratorProtocol, rounds: Int) {
        secretValueGenerator = valueGenerator
        roundsCount = rounds
        startNewRound()
    }
    
    //начать игру заново
    func restartGame() {
        rounds = []
        startNewRound()
    }
    //начать игру
    func startNewRound() {
        let newSecretValue = self.getNewSecretValue()
        currentRound = GameRound(secretValue: newSecretValue)
        rounds.append( currentRound )
    }
    
        private func getNewSecretValue() -> Int {
            return secretValueGenerator.getRandomValue()
        }
}
