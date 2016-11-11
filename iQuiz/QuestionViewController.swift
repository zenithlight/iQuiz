//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Pradeep Jha on 11/11/16.
//  Copyright © 2016 Alexis Anand. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    
    @IBAction func button(_ sender: AnyObject) {
        previousChoice = picker.selectedRow(inComponent: 0)
        performSegue(withIdentifier: "answerSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = selectedItem.title
        label.text = selectedItem.questions[currentQuestion]
        
        picker.dataSource = self
        picker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return selectedItem.choices[currentQuestion].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return selectedItem.choices[currentQuestion][row]
    }
}
