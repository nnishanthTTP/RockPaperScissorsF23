//
//  Sign.swift
//  RockPaperScissors2ElectricBoogaloo
//
//  Created by Nidhin Nishanth on 11/16/23.
//

/* This file will be used to maintain our Sign data type. We'll create this as a enum to model our possible moves (since we only have a fixed number of choices) */

import Foundation

// this function will be used to generate a random sign. We'll generate a random number from 0 to 2, and use that number to choose our sign (0 -> rock, 1 -> paper, 2/default -> scissors)
func randomSign() -> Sign {
    let randomNumber = Int.random(in: 0 ... 2)
    switch randomNumber {
    case 0:
        return .rock
    case 1:
        return .paper
    default:
        return .scissors
    }
}

// this enum will create our Signs for us. Each sign will have an emoji we can use to display each move, and a method called gameState(), which will compare two signs and let us know if we've won/lose.
enum Sign {
    case rock
    case paper
    case scissors
    
    // this is a computed property - we'll check our value using a Switch statement to get the appropriate emoji
    var emoji: String {
        switch self {
        case .rock:
            return "👊" // fist
        case .paper:
            return "✋"  //open hand
        case .scissors:
            return "✌️" //peace
        }
    }
    
    // the gameState() method will take in another sign as a parameter, and this allows us to compare our current move with our opponent's.
    // we have three possible game states when we play the game: win, lose, or draw. This method will help us decide which state we're in, given our move and our opponent's move
    func gameState(against opponentSign: Sign) -> GameState {
        /* How to check what state we're in:
            Draw - easy to check for, we just need to have the same sign as our opponent
            Win - regardless of the move we make, every move only has one way to win, so we'll check what move we've made, and then check to see if our opponent has the only sign that'll give us a win
            Lose - since we've checked for a tie and a win, the only thing left that we can do is lose :(((((((
         */
        if self == opponentSign {
            return .draw
        }
        switch self {
        case .rock:
            if opponentSign == .scissors {
                return .win
            }
        case .paper:
            if opponentSign == .rock {
                return .win
            }
        case .scissors:
            if opponentSign == .paper {
                return .win
            }
        }
        return .lose
    }
}




