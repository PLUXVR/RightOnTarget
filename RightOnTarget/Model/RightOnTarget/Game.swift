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
    // Вычисляемое значение общего количества очков
    var score: Int {
        var totalScore: Int = 0
        for round in self.rounds {
            totalScore += round.score
        }
        return totalScore
    }
    // Текущий раунд
    var currentRound: GameRoundProtocol!
    // Массив раундов
    private var rounds: [GameRoundProtocol] = []
    // Генератор секретного значения
    var secretValueGenerator: GeneratorProtocol
    // Количество раундов
    private var roundsCount: Int!
    // Булевое значение окончание игры
    var isGameEnded: Bool {
        if roundsCount == rounds.count {
            return true
        } else {
            return false
        }
    }
    
    // Инициализатор класса (генератор случайного числа, количество раундов, также при иницализации вызывается метод startNewRound чтобы на экране сразу после запуска появилось серетно значение и игра началась без дополнительных действий)
    init(valueGenerator: GeneratorProtocol, rounds: Int) {
        secretValueGenerator = valueGenerator
        roundsCount = rounds
        startNewRound()
    }
    
    // Начать игру заново
    func restartGame() {
        rounds = []
        startNewRound()
    }
    // Начать игру
    func startNewRound() {
        // Сохраняем секретное значение в локальную переменную
        let newSecretValue = self.getNewSecretValue()
        // Создаем экземпляр класса GameRound
        currentRound = GameRound(secretValue: newSecretValue)
        // Добавляем экземпляр класса в массив раундов
        rounds.append( currentRound )
    }
    // Генерация секретного числа
    private func getNewSecretValue() -> Int {
        secretValueGenerator.getRandomValue()
    }
}
