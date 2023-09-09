//
//  ViewController.swift
//  RightOnTarget
//
//  Created by Максим Беседин on 15.08.2023.
//

import UIKit

class RightOnTargetViewController: UIViewController {
    // Сущность "Game"
    var game : Game!
    // Оутлет слайдера
    @IBOutlet var sliderOutlet: UISlider!
    // Оутлет текстового поля с загаданным числом
    @IBOutlet var labelOutlet: UILabel!
    
    // MARK: - Жизненный цикл
    
    override func loadView() {
        super.loadView()
        // Программно созданное тектовое поля для отображения версии игры
        let versionLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
        versionLabel.center.x = self.view.center.x
        versionLabel.center.y = 50
        versionLabel.text = "Версия программы 1.3"
        versionLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        // Добавление текстового поля с версией иры на экран
        self.view.addSubview(versionLabel)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Создание экземпляров классов Generator и Game
        let generator = Generator()
        game = Game(valueGenerator: generator, rounds: 5)
        // Обновление поля с секретным числом
        updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
    }
    
    //MARK: - Взаимодействие View - Model
    
    @IBAction func checkNumber () {
        // Проверка выбранного значения на слайдере и подсчет очков
        let numSlider = Int(sliderOutlet.value.rounded())
        game.currentRound.calculateScore(with: numSlider)
       // Если прошло 5 раундов игра окончена и отображается общее количество очков
        if game.isGameEnded {
            showAlertScore(score: game.score)
            game.restartGame()
        } else {
        // Если прошло меньше 5 раундов начинается следующий раунд пока не будет 5
            game.startNewRound()
        }
        // Обновление секретного числа при каждом нажатии checkNumber
        updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
    }
    
    //MARK: - Обновление текста загаданного значения
    
   func updateLabelWithSecretNumber (newText: String) {
        self.labelOutlet.text = String("Загаданное число: \(newText)")
    }
    
    //MARK: - Отображение всплывающего окна со счетом
    
    private func showAlertScore(score: Int) {
        let alert = UIAlertController.init(title: "Игра окончена", message: "Вы заработали \(score) очков", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Начать заново", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
