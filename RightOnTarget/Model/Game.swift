import Foundation

protocol GameProtocol {
    //количество заработанных очков
    var score : Int { get }
    //загаданное значение
    var currentSecretValue : Int { get }
    //проверка окончания игры
    var isGameEnded : Bool { get }
    //метод для начала новой игры
    func restartGame()
    //метод для начала нового раунда
    func startNewRound()
    //сравнение переданного значения с загаданным числом и начисление очков
    func calculateScore(with value: Int)
}


class Game : GameProtocol {
    //количество очков за игру
    var score: Int  = 0
    //минимальное загаданное значение
    private var minSecretValue : Int
    //Максимальное загаданное значение
    private var maxSecretValue : Int
    //текущее загаданное число
    var currentSecretValue: Int = 0
    //количество раундов
    private var lastRound: Int
    private var currentRound : Int = 1
    //вычисляемое свойство "если текущий раунд больше или равно последнему раунду вернуть true, если нет - false"
    var isGameEnded: Bool {
        if currentRound >= lastRound {
            return true
        } else {
            return false
        }
    }
    //инициализатор класса? (минимальное и максимальное значения, количество раундов, сгенерировать случайное число)
    init?(startValue : Int, endValue : Int, rounds: Int) {
        // Стартовое значение для выбора случайного числа не может быть больше конечного
        guard startValue <= endValue else {
            return nil
        }
        minSecretValue = startValue
        maxSecretValue = endValue
        lastRound = rounds
        currentSecretValue = self.getNewSecretValue()
    }
    //загадываем новое случайное значение. Возвращенное значение используется в init? и startNewRound()
    private func getNewSecretValue () -> Int {
        (minSecretValue...maxSecretValue).randomElement()!
    }
    //начать игру заново
    func restartGame() {
        currentRound = 0
        score = 0
        startNewRound()
    }
    //начать игру
    func startNewRound() {
        currentSecretValue = self.getNewSecretValue()
        currentRound += 1
    }
    //посчитать количество очков
    func calculateScore(with value: Int) {
        if value > currentSecretValue {
            score += 50 - value + currentRound
        } else if value < currentSecretValue {
            score += 50 - currentSecretValue + value
        } else {
            score += 50
        }
    }
}
