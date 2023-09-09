import Foundation
import UIKit

protocol GeneratorProtocol {
    func getRandomValue() -> Int
    func getRandomColor() -> UIColor
}

class Generator: GeneratorProtocol {
    // Генератор случайного числа для игры Right on target
    func getRandomValue() -> Int {
        Int(arc4random_uniform(UInt32(50) + 1))
    }
    // Генератор случайного цвета для игры Chose a color
    func getRandomColor() -> UIColor {
        return UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
    }
}
