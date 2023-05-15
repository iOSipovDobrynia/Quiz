//
//  QuestionsViewController.swift
//  Quiz
//
//  Created by Goodwasp on 07.05.2023.
//

import UIKit

class QuestionsViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet var questionProgressView: UIProgressView!
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedSlider: UIProgressView!
    @IBOutlet var rangedLabels: [UILabel]!
    
    //MARK: private properties
    private let questions = Question.getQuestions()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: IBActions
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
    }
    @IBAction func multipleAnswerButtonPressed() {
    }
    @IBAction func rangedAnswerButtonPressed() {
    }
}

