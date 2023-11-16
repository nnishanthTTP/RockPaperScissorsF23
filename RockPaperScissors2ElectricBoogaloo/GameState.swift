//
//  GameState.swift
//  RockPaperScissors2ElectricBoogaloo
//
//  Created by Nidhin Nishanth on 11/16/23.
//

import Foundation

// This GameState type will allow us to control what happens after we make a move.

enum GameState {
    case win, lose, draw    // these are the outcomes after playing a round
    case start              // we'll use this case to tell Swift what to do if we are starting a brand new round
    
    // I added this status property post-class, and I'm using this to change the statusLabel (see line 60 of ViewController.swift)
    var status: String {
        switch self {
        case .win:
            return "You win :)"
        case .lose:
            return "Do better"
        case .draw:
            return "Ugh a tie? :|"
        case .start:
            return "Rock, Paper, Scissors?"
        }
    }
}
