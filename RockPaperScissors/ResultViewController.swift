//
//  ResultViewController.swift
//  RockPaperScissors
//
//  Created by Shuowei Li on 2016-01-12.
//  Copyright © 2016 Shuowei Li. All rights reserved.
//

import UIKit

enum Shape: String {
    case Rock = "Rock"
    case Paper = "Paper"
    case Scissors = "Scissors"
    
    static func randomShape() -> Shape {
        let shapes = ["Rock", "Paper", "Scissors"]
        let randomChoice = Int(arc4random_uniform(3))
        return Shape(rawValue: shapes[randomChoice])!
    }
}

class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        displayResult()
    }
    
    @IBOutlet private weak var resultImage: UIImageView!
    @IBOutlet private weak var resultLabel: UILabel!
    
    
    var userChoice: Shape!
    private let opponentChoice: Shape = Shape.randomShape()
    
    private func displayResult() {
        // Ideally, most of this would be handled by a model.
        var imageName: String
        var text: String
        let matchup = "\(userChoice.rawValue) vs. \(opponentChoice.rawValue)"
        
        // Why is an exclamation point necessary? :)
        switch (userChoice!, opponentChoice) {
        case let (user, opponent) where user == opponent:
            text = "\(matchup): it's a tie!"
            imageName = "tie"
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
            text = "You win with \(matchup)!"
            imageName = "\(userChoice.rawValue)-\(opponentChoice.rawValue)"
        default:
            text = "You lose with \(matchup) :(."
            imageName = "\(opponentChoice.rawValue)-\(userChoice.rawValue)"
        }
        
        imageName = imageName.lowercaseString
        resultImage.image = UIImage(named: imageName)
        resultLabel.text = text
    }

    @IBAction func playAgain() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
