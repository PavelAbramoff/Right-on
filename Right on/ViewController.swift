//
//  ViewController.swift
//  Right on
//
//  Created by Pavel Абрамов on 22.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    
    var number: Int = 0
    var round: Int = 0
    var points: Int = 0
    
    @IBAction func checkNumber() {
        if self.round == 0 {
            self.number = Int.random(in: 1...50)
            self.label.text = String(self.number)
            self.round = 1
    } else {
        let numberSlider = Int(self.slider.value.rounded())
        if numberSlider > self.number {
            self.points += 50 - numberSlider + self.number
        } else if numberSlider < self.number {
            self.points += 50 - self.number + numberSlider
        } else {
            self.points += 50
        }
        if self.round == 5 {
            let alert = UIAlertController(title: "Игра окончена", message: "Вы заработали \(self.points) очков", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            self.round = 1
            self.points = 0
        } else {
            self.round += 1
        }
        self.number = Int.random(in: 1...50)
        self.label.text = String(self.number)
    }
    
        func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

}
