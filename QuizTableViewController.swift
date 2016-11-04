//
//  QuizTableViewController.swift
//  iQuiz
//
//  Created by Alexis Anand on 11/3/16.
//  Copyright © 2016 Alexis Anand. All rights reserved.
//

import UIKit

class QuizTableViewController: UITableViewController {
    struct QuizItem {
        var image = UIImage(contentsOfFile: "/Users/pjha/Downloads/Alpha-50.png")
        var title = ""
        var description = ""
    }
    
    @IBAction func settingsPressed(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    let items: Array<QuizItem> = [
        QuizItem(image: UIImage(contentsOfFile: "/Users/pjha/Downloads/Alpha-50.png"), title: "Mathematics", description: "Simple equations and formulas"),
        QuizItem(image: UIImage(contentsOfFile: "/Users/pjha/Downloads/Movie-50.png"), title: "Marvel Super Heroes", description: "Beloved comic book characters"),
        QuizItem(image: UIImage(contentsOfFile: "/Users/pjha/Downloads/Biotech-50.png"), title: "Science", description: "Physics, chemistry, and more")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
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
        
        cell.textLabel?.text = self.items[indexPath.row].title
        cell.detailTextLabel?.text = self.items[indexPath.row].description
        cell.imageView?.image = self.items[indexPath.row].image
        
        return cell
    }
    
    /*// In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

}
