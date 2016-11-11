//
//  AppDelegate.swift
//  iQuiz
//
//  Created by Alexis Anand on 11/3/16.
//  Copyright © 2016 Alexis Anand. All rights reserved.
//

import UIKit

struct QuizItem {
    var image = UIImage(contentsOfFile: "/Users/pjha/Downloads/Alpha-50.png")
    var title = ""
    var description = ""
    var questions = [""]
    var answers = [0]
    var choices = [[""]]
}

let items: Array<QuizItem> = [
    QuizItem(image: UIImage(contentsOfFile: "/Users/pjha/Downloads/Alpha-50.png"),
             title: "Mathematics",
             description: "Simple equations and formulas",
             questions: ["2+2", "5*3", "7^2"],
             answers: [1, 1, 0],
             choices: [["3", "4", "5", "6"], ["14", "15", "16", "17"], ["49", "50", "51", "52"]]
    ),
    QuizItem(image: UIImage(contentsOfFile: "/Users/pjha/Downloads/Movie-50.png"),
             title: "Marvel Super Heroes",
             description: "Beloved comic book characters",
             questions: ["2+2", "5*3", "7^2"],
             answers: [1, 1, 0],
             choices: [["3", "4", "5", "6"], ["14", "15", "16", "17"], ["49", "50", "51", "52"]]
    ),
    QuizItem(image: UIImage(contentsOfFile: "/Users/pjha/Downloads/Biotech-50.png"),
             title: "Science",
             description: "Physics, chemistry, and more",
             questions: ["2+2", "5*3", "7^2"],
             answers: [1, 1, 0],
             choices: [["3", "4", "5", "6"], ["14", "15", "16", "17"], ["49", "50", "51", "52"]]
    )
]

var selectedItem: QuizItem = items[0]
var currentQuestion: Int = 0
var totalCorrect: Int = 0
var previousChoice: Int = 0

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

