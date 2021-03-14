import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    var quizzBrain = QuizBrain()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        progressBar.progress = 0
    }
    


    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let y = quizzBrain.checkAnswer(userAnswer)
        
        if y {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
            return
        }
        quizzBrain.nextQuestion()

        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI),userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionText.text = quizzBrain.getQuestionText()
        progressBar.progress = quizzBrain.getProgress()
        scoreLabel.text = quizzBrain.updateScore()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
    }
    
}

