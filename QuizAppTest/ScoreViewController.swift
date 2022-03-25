//
//  ScoreViewController.swift
//  QuizAppTest
//
//  Created by Gwinyai Nyatsoka on 13/3/2022.
//

import UIKit

class ScoreViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    var score: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Score \(score)"
        
    }
    
    @IBAction func acceptButtonDidTouch(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
