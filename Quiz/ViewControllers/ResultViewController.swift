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
    @IBOutlet var resultAnimalDefinitionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        let resultAnimal = calculateMostFrequentAnimal(from: answers)
        
        setResult(resultAnimal: resultAnimal)
    }
    
    //MARK: IBActions
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
}

extension ResultViewController {
    private func calculateMostFrequentAnimal(from answers: [Answer]) -> Animal {
        let animalCount = countAnimals(from: answers)
        
        let sortedAnimalCount = animalCount.sorted { $0.value > $1.value }
        
        let result = sortedAnimalCount.first?.key ?? .cat
    
        return result
    }
    
    private func countAnimals(from answers: [Answer]) -> [Animal: Int] {
        var animalCount: [Animal: Int] = [:]

        for answer in answers {
            if let count = animalCount[answer.animal] {
                animalCount.updateValue(count + 1, forKey: answer.animal)
            } else {
                animalCount[answer.animal] = 1
            }
        }
        
        return animalCount
    }
    
    private func setResult(resultAnimal: Animal) {
        resultAnimalLabel.text = "Вы – \(resultAnimal.rawValue)"
        resultAnimalDefinitionLabel.text = resultAnimal.definition
    }
}
