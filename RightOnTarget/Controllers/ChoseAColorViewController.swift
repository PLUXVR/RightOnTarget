//
//  SecondViewController.swift
//  RightOnTarget
//
//  Created by Максим Беседин on 19.08.2023.
//

import UIKit

class ChoseAColorViewController: UIViewController {
    // Сущность gameColor
    var gameColor : GameColorProtocol!
    // Сущность colorGameRound
    var colorGameRound : ColorRoundProtocol!
    //  Оутлеты 4 кнопок и тектового поля с секретным цветом
    @IBOutlet var buttonOneOutlet: UIButton!
    @IBOutlet var buttonTwoOutlet: UIButton!
    @IBOutlet var buttonThreeOutlet: UIButton!
    @IBOutlet var buttonFourOutlet: UIButton!
    @IBOutlet var secretColorOutlet: UILabel!
    
    // MARK: - Жизненный цикл
    
    override func loadView() {
        super.loadView()
        // Программно созданное тектовое поля для отображения версии игры
        let versionLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
        versionLabel.center.x = self.view.center.x
        versionLabel.center.y = 50
        versionLabel.text = "Версия программы 1.2"
        versionLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        // Добавление текстового поля с версией иры на экран
        self.view.addSubview(versionLabel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Создание экземпляров классов Generator и GameColor
        let generator = Generator()
        gameColor = GameColor(colorGenerator: generator, rounds: 5)
        // Обновление поля с секретным цветом
        updateLabelWithSecretColor(newColor: gameColor.currentRound.currentSecretColor)
        
        Newcolors()
    }
    
   
    
    @IBAction func Newcolors() {
        
        let arrayButtons = [buttonOneOutlet, buttonTwoOutlet, buttonThreeOutlet, buttonFourOutlet]
        
        gameColor.getNewColors(with: arrayButtons)
       
    }
    
    @IBAction func buttonOneAction() {
        checkColor(currentButton: buttonOneOutlet)
        Newcolors()
    }
    @IBAction func buttonTwoAction() {
        checkColor(currentButton: buttonTwoOutlet)
        Newcolors()
    }
    @IBAction func buttonThreeAction() {
        checkColor(currentButton: buttonThreeOutlet)
        Newcolors()
    }
    @IBAction func buttonFourAction() {
        checkColor(currentButton: buttonFourOutlet)
        Newcolors()
    }

    func checkColor (currentButton : UIButton) {
        
        let buttonColor = currentButton.backgroundColor
        
        gameColor.currentRound.calculateScore(with: buttonColor!)
        
        if gameColor.isGameEnded {
            
            showAlertScore(score: gameColor.score)
            
            gameColor.restartGame()
            
        } else {
            
            gameColor.startNewRound()
            
        }
        updateLabelWithSecretColor(newColor: gameColor.currentRound.currentSecretColor)
    }
    
    func updateLabelWithSecretColor (newColor: UIColor) {
        self.secretColorOutlet.text = String("Загаданный цвет: \(newColor.hex)")
        self.secretColorOutlet.backgroundColor = newColor
    }
    
    private func showAlertScore(score: Int) {
        let alert = UIAlertController.init(title: "Игра окончена", message: "Вы заработали \(score) очков", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Начать заново", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}



extension UIColor {
    var hex: String{
        get {
            var red:CGFloat = 0
            var blue:CGFloat = 0
            var green:CGFloat = 0
            var alpha:CGFloat = 0

            self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            let rgb:Int = (Int)(red*255)<<16 | (Int)(green*255)<<8 | (Int)(blue*255)<<0
            return String.localizedStringWithFormat("#%06x", rgb)
        }
    }
}

