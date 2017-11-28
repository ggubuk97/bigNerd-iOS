//
//  ViewController.swift
//  Quiz
//
//  Created by Jaden Jung on 2017. 11. 14..
//  Copyright © 2017년 Jaden Jung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //@IBOutlet var questionLabel: UILabel!
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    let questions: [String] = ["From what is congnac made?",
                               "What is 7+7",
                               "What is the capital of Vermont?"]
    let answers: [String] = ["Grapes",
                             "14",
                             "Montpelier"]
    var currentQuestionIndex: Int = 0
    
    @IBAction func showNextQuestion(sender: AnyObject) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex]
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        
        animatedLabelTransitions()
    }
    
    @IBAction func showAnswer(sender: AnyObject) {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestionLabel.text = questions[currentQuestionIndex]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("viewWillAppear called")
        
        // Set the label's initial alpha
        nextQuestionLabel.alpha = 0
    }
    
    func animatedLabelTransitions() {
        // Animate the alpha
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [],
                       animations: {
                        self.currentQuestionLabel.alpha = 0
                        self.nextQuestionLabel.alpha = 1
                       },
                       completion: { _ in
                        swap(&self.currentQuestionLabel,
                             &self.nextQuestionLabel)
        })
    }
}

