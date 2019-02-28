//
//  FirstViewController.swift
//  Guesser
//
//  Created by Bourishetty,Karun on 2/26/19.
//  Copyright © 2019 Bourishetty,Karun. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    
 
    @IBOutlet weak var guessLBL: UITextField!
    
    
    @IBOutlet weak var outputLBL: UILabel!
    
    
    @IBAction func amirightLBL(_ sender: Any) {
        if let value = Int(guessLBL.text!) {
            let result = Guesser.shared.amIRight(guess: Int(value))
            if result == Guesser.Result.correct.rawValue{
                outputLBL.text = result
                displayMessage()
                Guesser.shared.createNewProblem()
            }else{
                outputLBL.text = result
            }
        }else{
            invalidMessage()
        }
    }
    
    @IBAction func newLBL(_ sender: Any) {
        guessLBL.text = ""
        outputLBL.text = "Output"
        Guesser.shared.createNewProblem()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Guesser.shared.createNewProblem()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func displayMessage(){
        let alert = UIAlertController(title: "Well done",
                                      message: "You got it in \(Guesser.shared.numAttempts) attempts",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default,
                                      handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func invalidMessage(){
        let alert = UIAlertController(title: "Invalid Data",
                                      message: "Enter a valid Integer between 1-10",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default,
                                      handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

