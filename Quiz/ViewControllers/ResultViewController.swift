//
//  ResultViewController.swift
//  Quiz
//
//  Created by Goodwasp on 15.05.2023.
//

import UIKit

class ResultViewController: UIViewController {
    //MARK: properties
    var answers: [Answer] = []
    @IBOutlet var resultAnimalLabel: UILabel!
    @IBOutlet var resultAnimalDefinition: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        let resultAnimal = calculateCountAnimal(from: answers)
        
        resultAnimalLabel.text = "Вы – \(resultAnimal.rawValue)"
        
        resultAnimalDefinition.text = resultAnimal.definition
    }
    
    //MARK: IBActions
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
}

extension ResultViewController {
    private func calculateCountAnimal(from answers: [Answer]) -> Animal {
        var result: Animal
        
        var animalCount: [Animal: Int] = [:]
        
        for answer in answers {
            if let count = animalCount[answer.animal] {
                animalCount[answer.animal] = count + 1
            } else {
                animalCount[answer.animal] = 1
            }
        }
        
        let sortedAnimalCount = animalCount.sorted { $0.value > $1.value }
        
        result = sortedAnimalCount.first?.key ?? .cat
    
        return result
    }
}
