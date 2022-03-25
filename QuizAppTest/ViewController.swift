//
//  ViewController.swift
//  QuizAppTest
//
//  Created by Gwinyai Nyatsoka on 12/3/2022.
//

import UIKit


class Question {
    var image: UIImage
    var correctAnswer: Int
    var firstAnswer: String
    var secondAnswer: String
    var thirdAnswer: String
    
    init(image: UIImage, correctAnswer: Int, firstAnswer: String, secondAnswer: String, thirdAnswer: String) {
        self.image = image
        self.correctAnswer = correctAnswer
        self.firstAnswer = firstAnswer
        self.secondAnswer = secondAnswer
        self.thirdAnswer = thirdAnswer
    }
}


class ViewController: UIViewController {
    
    @IBOutlet weak var firstAnswerButton: UIButton!

    @IBOutlet weak var secondAnswerButton: UIButton!
    
    @IBOutlet weak var thirdAnswerButton: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var questionImageView: UIImageView!
    
    var score: Int = 0
    
    var currentQuestion: Int = 0
    
    var questions: [Question] = [Question(image: UIImage(named: "lion")!, correctAnswer: 2, firstAnswer: "Hippo", secondAnswer: "Lion", thirdAnswer: "Giraffe"),
                                    Question(image: UIImage(named: "orange")!, correctAnswer: 1, firstAnswer: "Orange", secondAnswer: "Apple", thirdAnswer: "Lemon"),
                                 Question(image: UIImage(named: "orange")!, correctAnswer: 3, firstAnswer: "Pineapple", secondAnswer: "Grape", thirdAnswer: "Orange")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let question = questions[currentQuestion]
        firstAnswerButton.setTitle(question.firstAnswer, for: .normal)
        secondAnswerButton.setTitle(question.secondAnswer, for: .normal)
        thirdAnswerButton.setTitle(question.thirdAnswer, for: .normal)
        questionImageView.image = question.image
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ScoreViewController
        destinationVC.score = score
    }
    
    func nextQuestion() {
        if questions.count > currentQuestion + 1 {
            currentQuestion += 1
            let question = questions[currentQuestion]
            firstAnswerButton.setTitle(question.firstAnswer, for: .normal)
            secondAnswerButton.setTitle(question.secondAnswer, for: .normal)
            thirdAnswerButton.setTitle(question.thirdAnswer, for: .normal)
            questionImageView.image = question.image
        } else {
            performSegue(withIdentifier: "ScoreSegue", sender: nil)
        }
    }
    
    func check(answer: Int) {
        let question = questions[currentQuestion]
        if question.correctAnswer == answer {
            score += 1
            scoreLabel.text = "Score: \(score)"
            let alert = UIAlertController(title: "Correct!", message: "You got the correct answer!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { action in
                alert.dismiss(animated: true, completion: nil)
                self.nextQuestion()
            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Wrong!", message: "You got the wrong answer!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { action in
                alert.dismiss(animated: true, completion: nil)
                self.nextQuestion()
            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func firstAnswerButtonDidTouch(_ sender: Any) {
        check(answer: 1)
    }
    
    @IBAction func secondAnswerButtonDidTouch(_ sender: Any) {
        check(answer: 2)
    }
    
    @IBAction func thirdAnswerButtonDidTouch(_ sender: Any) {
        check(answer: 3)
    }

}

