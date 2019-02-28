import Foundation

class Guesser {
    private var correctAnswer:Int
    private var _numattempts:Int
    private var guesses: [Guess]
    
    struct Guess {
        var correctAnswer:Int
        var numAttemptsRequired:Int
    }
    
    var numAttempts:Int{
        return _numattempts
    }
    
    private init() {
        self.correctAnswer = 0
        self._numattempts = 0
        self.guesses = []
    }
    
    func guess(index: Int)->Guess{
        return guesses[index]
    }
    
    subscript(guess:Int)->Guess{
        return guesses[guess]
    }
    
    func clearStatistics(){
        guesses = []
    }
    
    func numOfGuesses() ->Int{
        return guesses.count
    }
    
    func createNewProblem() {
        let random = Int.random(in: 1...10)
        correctAnswer = random
        _numattempts = 0
    }
    
    static var shared = Guesser()
    
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
            guesses.append(Guess(correctAnswer: correctAnswer, numAttemptsRequired: _numattempts))
            return Result.correct.rawValue
        }
    }
    
    func minimumAttempts()->Int{
        var minimum = guesses[0].numAttemptsRequired
        for i in guesses{
            if minimum > i.numAttemptsRequired{
                minimum = i.numAttemptsRequired
            }
        }
        return minimum
    }
    
    func maximumAttempts()->Int{
        var maximum:Int
        if Guesser.shared.numAttempts == 0{
            maximum = 0
        }else{
            maximum = guesses[0].numAttemptsRequired
        }
        //var maximum = guesses[0].numAttemptsRequired
        for i in guesses{
            if maximum < i.numAttemptsRequired{
                maximum = i.numAttemptsRequired
            }
        }
        return maximum
    }
    
    
    enum Result:String {
        case tooLow = "Too Low"
        case tooHigh = "Too High"
        case correct = "Correct"
    }
    
    
    
    
}



