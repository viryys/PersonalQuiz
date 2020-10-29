//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 26.10.2020.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // +1. Передать сюда массив с ответами
    // +2. Определить наиболее часто встречающийся тип животного
    // +3. Отобразить результаты на экране
    // +4. Избавится от кнопки возврата на предыдущий экран

    @IBOutlet weak var whoAreYouLabel: UILabel!
    @IBOutlet weak var definitionLabel: UILabel!
    
    var answersChoosen: [Answer] = []
    
    private var finalResult: [AnimalType: Int] = [
        .dog: 0,
        .cat: 0,
        .turtle: 0,
        .rabbit: 0
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.setHidesBackButton(true, animated: true)
        
        for answer in answersChoosen {
            finalResult[answer.type]! += 1
        }
        
        let maximumMatch = finalResult.max { a, b in a.value < b.value }
        let yourAnimal = maximumMatch!.key
        
        definitionLabel.text = yourAnimal.definition
        whoAreYouLabel.text = "Вы - \(yourAnimal.image)!"
    }

}
