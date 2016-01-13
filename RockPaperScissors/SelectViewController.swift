//
//  SelectViewController.swift
//  RockPaperScissors
//
//  Created by Shuowei Li on 2016-01-12.
//  Copyright © 2016 Shuowei Li. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction private func playRock(sender: UIButton) {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
        vc.userChoice = getUserShape(sender)
        presentViewController(vc, animated: true, completion: nil)
    }
    
    @IBAction func playPaper(sender: UIButton) {
        performSegueWithIdentifier("play", sender: sender)
    }
    private func getUserShape(sender: UIButton) -> Shape {
        // Titles are set to one of: Rock, Paper, or Scissors
        let shape = sender.titleForState(.Normal)!
        return Shape(rawValue: shape)!
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "play" {
            let vc = segue.destinationViewController as! ResultViewController
            vc.userChoice = getUserShape(sender as! UIButton)
        }
    }


}

