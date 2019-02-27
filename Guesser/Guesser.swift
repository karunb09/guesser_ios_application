import Foundation

class Guesser {
    private var correctAnswer:Int
    private var _numattempts:Int
    private var guesses: [Guess]
    
    struct Guess {
        var correctAnswer:Int
        var numAttempltsRequired:Int
    }
    
    var numAttempts:Int{
        return _numattempts
    }
    
    init() {
        correctAnswer = 0
        _numattempts = 0
        guesses = []
    }
    
    private func createNewProblem() {
        let random = Int.random(in: 0..<10) + 1
        correctAnswer = random
        _numattempts = 0
    }
    
    func amIRight(guess: Int) -> String {
        _numattempts = _numattempts + 1
        //let generatedNum = createNewProblem()
        if(guess > correctAnswer){
            return Result.tooHigh.rawValue
        }
        else if(guess < correctAnswer){
            //Too low
            return Result.tooLow.rawValue
        }
        else{
            guesses.append((Guesser.Guess).init(correctAnswer: correctAnswer, numAttempltsRequired: _numattempts))
            createNewProblem()
            return ""
        }
    }
    
    enum Result:String {
        case tooLow = "Too Low"
        case tooHigh = "Too High"
        case correct = "Correct"
    }
    
 
    
    
}



