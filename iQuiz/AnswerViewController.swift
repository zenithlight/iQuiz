//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Pradeep Jha on 11/11/16.
//  Copyright © 2016 Alexis Anand. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!

    @IBAction func button(_ sender: AnyObject) {
        if currentQuestion == selectedItem.questions.count - 1 {
            performSegue(withIdentifier: "resultsSegue", sender: self)
        }
        else {
            currentQuestion += 1
            performSegue(withIdentifier: "backToQuestionSegue", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = selectedItem.questions[currentQuestion]
        
        if previousChoice == selectedItem.answers[currentQuestion] {
            correctLabel.text = "Correct!"
            totalCorrect += 1
        }
        else {
            correctLabel.text = "Incorrect!"
        }
        
        answerLabel.text = "Correct answer: " + selectedItem.choices[currentQuestion][selectedItem.answers[currentQuestion]]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
