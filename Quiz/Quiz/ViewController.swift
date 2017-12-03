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
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
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
        
        updateOffScreenLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("viewWillAppear called")
        
        // Set the label's initial alpha
        nextQuestionLabel.alpha = 0
    }
    
    func animatedLabelTransitions() {
        // Force any outstanding layout changes to occur
        view.layoutIfNeeded()
        
        // Animate the alpha
        // and the center X constraints
        let screenWidth = view.frame.width
        self.nextQuestionLabelCenterXConstraint.constant = 0
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth
 /*
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.curveEaseInOut, .repeat],
                       animations: {
                        self.currentQuestionLabel.alpha = 0
                        self.nextQuestionLabel.alpha = 1
                        
                        self.view.layoutIfNeeded()
                       },
                       completion: { _ in
                        swap(&self.currentQuestionLabel,
                             &self.nextQuestionLabel)
                        swap(&self.currentQuestionLabelCenterXConstraint,
                             &self.nextQuestionLabelCenterXConstraint)
                        
                        self.updateOffScreenLabel()
        })
 */
        // Bronze Challenge
        UIView.animate(withDuration:0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 5,
                       options: [.curveEaseInOut],
                       animations: {
                        self.currentQuestionLabel.alpha = 0
                        self.nextQuestionLabel.alpha = 1
                        
                        self.view.layoutIfNeeded()
                        },
                       completion: { _ in
                        swap(&self.currentQuestionLabel,
                             &self.nextQuestionLabel)
                        swap(&self.currentQuestionLabelCenterXConstraint,
                             &self.nextQuestionLabelCenterXConstraint)
                        
                        self.updateOffScreenLabel()
                        }
        )
    }
    
    func updateOffScreenLabel() {
        print("updateOffScreenLabel called")
        let screenWidth = view.frame.width
        nextQuestionLabelCenterXConstraint.constant = -screenWidth
    }
}

