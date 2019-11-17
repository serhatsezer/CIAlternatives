

import Foundation

class Game {
  let maxAttemptsAllowed = 10
  let maxNumberToGenerate = 4000
  
  var score: Int
  var attempt: Int
  var numbersToConvert: [Int]
  var answersToDisplay: [String]
  var isCorrectConversion: [Bool]
  
  var converter: Converter
  
  init() {
    score = 0
    attempt = 0
    numbersToConvert = []
    answersToDisplay = []
    isCorrectConversion = []
    converter = Converter()
    generatePlays()
  }
  
  func play(_ guess: Bool) -> (correct: Bool, score: Int)? {
    if done() {
      return nil
    }
    if isCorrectConversion[attempt] == guess {
      score = score + 1
      attempt = attempt + 1
      return (true, score)
    } else {
      attempt = attempt + 1
      return (false, score)
    }
  }
  
  func showNextPlay() -> (question: Int, answer: String) {
    return (numbersToConvert[attempt], answersToDisplay[attempt])
  }
  
  func done() -> Bool {
    return attempt >= maxAttemptsAllowed
  }
  
  func reset() {
    score = 0
    attempt = 0
    
    numbersToConvert.removeAll()
    answersToDisplay.removeAll()
    isCorrectConversion.removeAll()
    
    generatePlays()
  }
}

// MARK: - Private methods
private extension Game {
  func generatePlays() {
    numbersToConvert = (1...maxAttemptsAllowed).map{_ in
      Int(arc4random_uniform(UInt32(maxNumberToGenerate))) + 1
    }
    answersToDisplay = numbersToConvert.enumerated().map{ (index, numberToConvert) in
      generateAnswers(index, number: numberToConvert)
    }
  }
  
  func showWrongConversion() -> Bool {
    return arc4random_uniform(2) == 0
  }
  
  func generateAnswers(_ index: Int, number: Int) -> String {
    // TODO: (Final project) Uncomment line below and comment out following line
    // to use the converter
    let correctAnswer = converter.convert(number)
    // TODO: (Starter project) Uncomment line below and comment out the previous
    // line
    //    let correctAnswer = "ABCD"
    if showWrongConversion() {
      isCorrectConversion.append(false)
      return correctAnswer.garbled()
    } else {
      isCorrectConversion.append(true)
      return correctAnswer
    }
  }
}
