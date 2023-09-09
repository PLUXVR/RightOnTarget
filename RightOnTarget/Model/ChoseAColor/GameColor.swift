import Foundation
import UIKit

protocol GameColorProtocol {
    // Количество заработанных очков
    var score: Int { get }
    // Текущий раунд
    var currentRound: ColorRoundProtocol! { get }
    // Проверяет, окончена ли игра
    var isGameEnded: Bool { get }
    // Генератор случайного значения
    var secretColorGenerator: GeneratorProtocol { get }
    //  Окрашивает кнопки в новые цвета
    func getNewColors(with arrayButtons: [UIButton?])
    // Начинает новую игру и сразу стартует первый раунд
    func restartGame()
    // Начинает новый раунд
    func startNewRound()
}

class GameColor : GameColorProtocol {
    // Вычисляемое значение общего количества очков
    var score: Int {
        var totalScore: Int = 0
        for round in self.rounds {
            totalScore += round.score
        }
        return totalScore
    }
    // Текущий раунд
    var currentRound: ColorRoundProtocol!
    // Массив раундов
    private var rounds: [ColorRoundProtocol] = []
    // Генератор секретного значения
    var secretColorGenerator: GeneratorProtocol
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
    
    // Инициализатор класса (Генератор секретного цвета, количество раундов)
    init(colorGenerator: GeneratorProtocol, rounds: Int) {
        self.secretColorGenerator = colorGenerator
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
        let newSecretColor = self.getNewSecretColor()
        currentRound = ColorGameRound(secretColor: newSecretColor)
        rounds.append( currentRound )
    }
    
    // Функция для закрашивания кнопок
    func getNewColors(with arrayButtons : [UIButton?]) {
        var arrayColors = [UIColor]()
        // В этот же массив добавляем загаданный цвет
        arrayColors.append(currentRound.currentSecretColor)
        // В массив цветов добавляем 3 рандомных цвета
        for _ in 0...arrayButtons.count - 1 {
            while arrayColors.count < 4 {
                if !arrayColors.contains(getNewSecretColor()) {
                    arrayColors.append(getNewSecretColor())
                }
            }
        }
        // Закрашиваем кнопки в цвета из массива arrayColors
        for button in arrayButtons {
            let currentColor = arrayColors.randomElement()
            button?.backgroundColor = currentColor
            arrayColors.remove(at: arrayColors.firstIndex(of: currentColor!)!)
            print("\(button!.backgroundColor!.hex)")
        }
        print("-----------------------")
    }
    // Генерация секретного цвета
    private func getNewSecretColor() -> UIColor {
        secretColorGenerator.getRandomColor()
    }
}
