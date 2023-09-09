import Foundation
import UIKit


protocol ColorRoundProtocol {
    // Количество заработанных очков
    var score : Int { get }
    // Загаданный цвет
    var currentSecretColor : UIColor { get }
    // Сравнение переданного значения с загаданным цветом и начисление очков
    func calculateScore (with color : UIColor)
}

class ColorGameRound : ColorRoundProtocol {

    var score: Int = 0
    var currentSecretColor: UIColor = .white
    
    // Инициализатор класса (Секуретный цвет)
    init(secretColor: UIColor) {
        currentSecretColor = secretColor
    }
    // Вычисление очков за раунд
    func calculateScore(with color: UIColor) {
        if color == currentSecretColor {
            score += 10
        } 
    }
}
