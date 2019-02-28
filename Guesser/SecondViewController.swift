//
//  SecondViewController.swift
//  Guesser
//
//  Created by Bourishetty,Karun on 2/26/19.
//  Copyright © 2019 Bourishetty,Karun. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Guesser.shared.numOfGuesses()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "row")!
        cell.textLabel?.text = "Correct Answer: " + String(Guesser.shared[indexPath.row].correctAnswer)
        cell.detailTextLabel?.text = "# Attempts: " + String(Guesser.shared[indexPath.row].numAttemptsRequired)
        return cell
    }
    
    
    
    @IBOutlet weak var tableViewLBL: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        tableViewLBL.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewLBL.delegate = self
        tableViewLBL.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }


}

