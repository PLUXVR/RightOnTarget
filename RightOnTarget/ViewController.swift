//
//  ViewController.swift
//  RightOnTarget
//
//  Created by Максим Беседин on 15.08.2023.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet var sliderOutlet: UISlider!
    
    @IBOutlet var labelOutlet: UILabel!
    
    var number : Int = .random(in: 1...50)
    
    var round : Int = 1
    
    var points : Int = 0
    
    lazy var secondViewController = getSecondViewController()
    
    private func getSecondViewController () -> SecondViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
        return secondViewController as! SecondViewController
    }
    
    
    override func loadView() {
        super.loadView()
        print("loadView")
        
        let versionLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
        
        versionLabel.text = "Версия программы 1.1"
        
        self.view.addSubview(versionLabel)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        self.number = Int.random(in: 1...50)
        self.labelOutlet.text = String("Загаданное число: \(self.number)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
        
    }
    
    @IBAction func checkNumber () {
        // получаем значение на слайдере
        let numSlider = Int(sliderOutlet.value.rounded())
        // сравниваем значение с загаданным
        // и подсчитываем очки
        if numSlider >= self.number {
            self.points += 50 - numSlider + self.number
        } else if numSlider <= self.number {
            self.points += 50 - self.number + numSlider
        } else {
            self.points += 50
        }
        
        if self.round == 5 {
            // выводим информационное окно
            // с результатами игры
            let alert = UIAlertController.init(title: "Игра окончена", message: "Вы заработали \(self.points) очков", preferredStyle: .alert)
            alert.addAction(UIAlertAction.init(title: "Начать заново", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            self.round = 1
            self.points = 0
        } else {
            self.round += 1
        }
        
        // генерируем случайное число
        self.number = Int.random(in: 1...50)
        // передаем значение случайного числа в label
        self.labelOutlet.text = String("Загаданное число: \(self.number)")
    }
    
    
}
