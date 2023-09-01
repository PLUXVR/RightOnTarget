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
    //сущность "GameRound"
    var gameRound: GameRound!
    
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
        let generator = Generator()
        game = Game(valueGenerator: generator, rounds: 5)
        updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
    }
    
    //MARK: - Взаимодействие View - Model
    
    @IBAction func checkNumber () {
        
        let numSlider = Int(sliderOutlet.value.rounded())
        
        var totalScore : Int {
            var score = 0
            
            for _ in 1...game.lastRound {
                score += game.currentRound.score
            }
            
            return score
        }
        
        game.currentRound.calculateScore(with: numSlider)
        
        if game.isGameEnded {
            
            showAlertScore(score: totalScore)
            
            game.restartGame()
            
        } else {
            
            game.startNewRound()
            
        }
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
