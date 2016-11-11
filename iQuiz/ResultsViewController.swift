//
//  ResultsViewController.swift
//  iQuiz
//
//  Created by Pradeep Jha on 11/11/16.
//  Copyright © 2016 Alexis Anand. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var grade: UILabel!
    @IBOutlet weak var score: UILabel!

    @IBAction func button(_ sender: AnyObject) {
        currentQuestion = 0
        totalCorrect = 0
        performSegue(withIdentifier: "backToMenuSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if totalCorrect == selectedItem.questions.count {
            grade.text = "Perfect!"
        }
        else {
            grade.text = "Almost..."
        }
        
        score.text = String(totalCorrect) + "/" + String(selectedItem.questions.count) + " correct."
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
