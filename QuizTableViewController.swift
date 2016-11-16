//
//  QuizTableViewController.swift
//  iQuiz
//
//  Created by Alexis Anand on 11/3/16.
//  Copyright © 2016 Alexis Anand. All rights reserved.
//

import UIKit

class QuizTableViewController: UITableViewController {
    @IBAction func settingsPressed(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadQuizzes(from: "https://tednewardsandbox.site44.com/questions.json")
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = items[indexPath.row].title
        cell.detailTextLabel?.text = items[indexPath.row].description
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedItem = items[indexPath.row]
        performSegue(withIdentifier: "questionSegue", sender: self)
    }
    
    func loadQuizzes(from: String) {
        items = [] // reset the quizzes so we don't have duplicates
        
        let fileManager: FileManager = FileManager.default
        
        let libraryPath = fileManager.urls(for: .libraryDirectory, in: .userDomainMask).first
        let quizFile = libraryPath!.appendingPathComponent("quiz.json").path
        
        do {
            let quizData = try String(contentsOf: URL(string: from)!)
            try quizData.write(toFile: quizFile, atomically: true, encoding: String.Encoding.utf8)
        }
        catch {
            print("Could not load remote data file.")
        }

        if fileManager.fileExists(atPath: quizFile) {
            do {
                let loadedQuiz = try Data(contentsOf: URL(fileURLWithPath: quizFile))
                print(loadedQuiz)
                if let quizJSON = try JSONSerialization.jsonObject(with: loadedQuiz) as? Array<Dictionary<String, AnyObject>> {
                    for item in quizJSON {
                        items.append(QuizItem(title: item["title"] as! String, description: item["desc"] as! String, questions: item["questions"] as! Array<Dictionary<String, AnyObject>>))
                    }
                }
                
                self.tableView.reloadData()
            }
            catch {
                print("Could not load local JSON quiz data.")
            }
        }
    }
}
