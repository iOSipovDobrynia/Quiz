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
    @IBOutlet var rangedProgress: UIProgressView!
    @IBOutlet var rangedLabels: [UILabel]!
    
    //MARK: private properties
    private let questions = Question.getQuestions()
    private var answersChosen: [Answer] = []
    private var questionIndex = 0
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }
    
    //MARK: UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    //MARK: IBActions
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        guard let buttonIndex = singleButtons.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswers[buttonIndex]
        answersChosen.append(currentAnswer)
        
        nextQuestion()
    }
    @IBAction func multipleAnswerButtonPressed() {
        for (multipleSwitch, currentAnswer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                answersChosen.append(currentAnswer)
            }
        }
        
        nextQuestion()
    }
    @IBAction func rangedAnswerButtonPressed() {
    }
}

//MARK: Private Methods
extension QuestionsViewController {
    private func updateUI() {
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }

        let currentQuestion = questions[questionIndex]

        questionLabel.text = currentQuestion.title
        
        let totalProgress = Float(questionIndex) / Float(questions.count)
        questionProgressView.setProgress(totalProgress, animated: true)
        
        title = "Вщпрос № \(questionIndex + 1) из \(questions.count)"
        
        showCurrentAnswers(for: currentQuestion.responseType)
    }
    
    private func showCurrentAnswers(for type: ResponseType) {
        switch type {
        case .single:
            showSingleStackView(with: currentAnswers)
        case .multiple:
            showMultipleStackView(with: currentAnswers)
        case .ranged:
            break
        }
    }
    
    private func showSingleStackView(with answers: [Answer]) {
        singleStackView.isHidden.toggle()
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.title, for: .normal)
        }
    }
    
    private func showMultipleStackView(with answers: [Answer]) {
        multipleStackView.isHidden.toggle()
        
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.title
        }
    }
    
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
            return
        }
        
        performSegue(withIdentifier: "showResult", sender: nil)
    }
}
