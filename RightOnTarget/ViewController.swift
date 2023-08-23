//
//  ViewController.swift
//  RightOnTarget
//
//  Created by Максим Беседин on 15.08.2023.
//

import UIKit

class ViewController: UIViewController {
    //сущность "Game"
    var game : Game!
    
    @IBOutlet var sliderOutlet: UISlider!
    
    @IBOutlet var labelOutlet: UILabel!
    
    //MARK: - Жизненный цикл
    
    override func loadView() {
        super.loadView()
        let versionLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
        versionLabel.text = "Версия программы 1.2"
        self.view.addSubview(versionLabel)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        game = Game(startValue: 1, endValue: 50, rounds: 5)
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }
    
    //MARK: - Взаимодействие View - Model
    
    @IBAction func checkNumber () {
        
        let numSlider = Int(sliderOutlet.value.rounded())
        game.calculateScore(with: numSlider)
        
        if game.isGameEnded {
            
            showAlertScore(score: game.score)
            
            game.restartGame()
            
        } else {
            game.startNewRound()
            
        }
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }
    
    //MARK: - Обновление текста загаданного значения
    
    private func updateLabelWithSecretNumber (newText: String) {
        self.labelOutlet.text = String("Загаданное число: \(newText)")
    }
    
    //MARK: - Отображение всплывающего окна со счетом
    
    private func showAlertScore(score: Int) {
        let alert = UIAlertController.init(title: "Игра окончена", message: "Вы заработали \(score) очков", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Начать заново", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
