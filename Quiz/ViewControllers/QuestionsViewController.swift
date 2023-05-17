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
    //MARK: private properties
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    
    //MARK: UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
//        updateUI()
    }
    
    //MARK: IBActions

}

////MARK: Private Methods
//extension QuestionsViewController {
//    private func updateUI() {
//        for stackView in [singleStackView, multipleStackView, rangedStackView] {
//            stackView?.isHidden = true
//        }
//
//        let currentQuestion = questions[questionIndex]
//
//        questionLabel.text = currentQuestion.title
//    }
//}
