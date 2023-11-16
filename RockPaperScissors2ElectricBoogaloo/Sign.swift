//
//  Sign.swift
//  RockPaperScissors2ElectricBoogaloo
//
//  Created by Nidhin Nishanth on 11/16/23.
//

import Foundation

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

enum Sign {
    case rock
    case paper
    case scissors
    
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
    
    func gameState(against opponentSign: Sign) -> GameState {
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




