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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    //MARK: IBActions
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
}
