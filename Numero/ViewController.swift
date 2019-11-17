

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var converterLabel: UILabel!
  @IBOutlet weak var numberLabel: UILabel!
  @IBOutlet weak var romanNumeralLabel: UILabel!
  
  @IBOutlet weak var falseButton: UIButton!
  @IBOutlet weak var trueButton: UIButton!
  
  var game: Game?
  var score: Int? {
    didSet {
      if let score = score, let game = game {
        scoreLabel.text = "\(score) / \(game.maxAttemptsAllowed)"
      }
    }
  }
  var originalIndicatorColor: UIColor?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    game = Game()
    originalIndicatorColor = converterLabel.textColor
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    game?.reset()
    score = game?.score
    numberLabel.center.x -= view.bounds.width
    romanNumeralLabel.center.x += view.bounds.width
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    showNextPlay()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "gameDoneSegue" {
      if let destinationViewController = segue.destination as? GameDoneViewController {
        destinationViewController.score = score
      }
    }
  }
  
  @IBAction func choiceButtonPressed(_ sender: UIButton) {
    if sender == falseButton {
      play(false)
    } else if sender == trueButton {
      play(true)
    }
  }
  
}

// MARK: - Private methods
private extension ViewController {
  func showNextPlay() {
    guard let game = game else { return }
    if !game.done() {
      let (question, answer) = game.showNextPlay()
      numberLabel.text = "\(question)"
      romanNumeralLabel.text = answer
      converterLabel.textColor = originalIndicatorColor
      controlsEnabled(true)
      // Show info
      UIView.animate(withDuration: 0.5) {
        self.numberLabel.center.x += self.view.bounds.width
        self.romanNumeralLabel.center.x -= self.view.bounds.width
        self.converterLabel.alpha = 1.0
      }
    }
  }
  
  func controlsEnabled(_ on: Bool) {
    falseButton.isEnabled = on
    trueButton.isEnabled = on
  }
  
  func play(_ selection: Bool) {
    controlsEnabled(false)
    if let result = game?.play(selection) {
      score = result.score
      displayResults(result.correct)
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(2000)) {
      if (self.game?.done())! {
        self.performSegue(withIdentifier: "gameDoneSegue", sender: nil)
      } else {
        // Clear info
        UIView.animate(withDuration: 0.5, animations: {
          self.numberLabel.center.x -= self.view.bounds.width
          self.romanNumeralLabel.center.x += self.view.bounds.width
          self.converterLabel.alpha = 0.0
        }, completion: { _ in
          DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
            self.showNextPlay()
          }
        })
      }
    }
  }
  
  func displayResults(_ correct: Bool) {
    if correct {
      print("You answered correctly!")
      converterLabel.textColor = .green
    } else {
      print("That one got you.")
      converterLabel.textColor = .red
    }
    // Visual indicator of correctness
    UIView.animate(withDuration: 0.5, animations: {
      self.converterLabel.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
    }, completion: { _ in
      UIView.animate(withDuration: 0.5) {
        self.converterLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
      }
    })
  }
}

