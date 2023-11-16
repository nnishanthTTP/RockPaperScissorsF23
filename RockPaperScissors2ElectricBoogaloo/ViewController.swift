//
//  ViewController.swift
//  RockPaperScissorsF23
//
//  Created by Nidhin Nishanth on 11/16/23.
//

/*
 For this project, we're following the Model-View-Controller design structure, which is as follows:
 - Model: sets up the data structures for our game. Swift doesn't know what Rock Paper Scissors is, so we need to define it by telling Swift how we can play the game (i.e. the Sign choices) and what outcomes we can get (win/lose/draw)
 - View: sets up the layout / design of the screen. We'll add some labels and buttons to our storyboard and connect it to our ViewController.swift file
 - Controller (not to be confused with the view controller!): sets up the logic of the game. This connects the Model and View together (i.e. if we click the Rock button in our view, we should play the game with our choice as Rock and the screen should update accordingly)
 */

/* Since we're creating new Types to model our game, it usually makes sense to create them in separate files: that way, we can maintain the individual parts of our data structure and use them together in this file. */

import UIKit

// This file will be used to connect our data structures to our storyboard - when we press the buttons and interact with our screen, we should be able to play the game and get some sort of result
class ViewController: UIViewController {
    
    // These outlets will connect all the UI elements to our code as variables, so we can edit these items through code (i.e. change the text for each label, enable/disable/hide/unhide our buttons)
    @IBOutlet var opponentLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    
    @IBOutlet var rockButton: UIButton!
    @IBOutlet var paperButton: UIButton!
    @IBOutlet var scissorsButton: UIButton!
    
    @IBOutlet var playAgainButton: UIButton!
    
    // This function controls what happens when the app first loads. We'll "update" the app to let us start a new round of Rock, Paper, Scissors
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(for: .start)
    }
    
    // The rockChosen / paperChosen / scissorsChosen actions are connected to the corresponding buttons on our screen, and will call the play() method with our chosen move
    @IBAction func rockChosen(_ sender: Any) {
        play(userSign: .rock)
    }
    
    @IBAction func paperChosen(_ sender: Any) {
        play(userSign: .paper)
    }
    
    @IBAction func scissorsChosen(_ sender: Any) {
        play(userSign: .scissors)
    }
    
    // Tapping the 'Play Again' button should (re)start a new round, so we'll do that with our updateUI() method
    @IBAction func playAgain(_ sender: Any) {
        updateUI(for: .start)
    }
    
    // This updateUI() method will update the screen depending on the state of our game. If we've finished and have an outcome (win/lose/draw), we'll change the status label and color of the screen.
    // For our "start" state, we'll unhide and enable the buttons in case they aren't already active. We'll also hide the "Play Again" button, so that we can only restart after we've made a move.
    // fyi I changed the colors from what we had in class, since I thought these were easier on the eyes :)
    func updateUI(for state: GameState) {
        // I reworked some of the code from what we did in class. I created a property called status for my GameState, so that instead of having to update the status label numerous times in my Switch statement, I'll update it once at the beginning using the current state of the game.
        statusLabel.text = state.status
        switch state {
        case .win:
            view.backgroundColor = .systemGreen
        case .lose:
            view.backgroundColor = .systemRed
        case .draw:
            view.backgroundColor = .lightGray
        case .start:
            view.backgroundColor = .systemGray
            
            rockButton.isHidden = false
            paperButton.isHidden = false
            scissorsButton.isHidden = false
            
            rockButton.isEnabled = true
            paperButton.isEnabled = true
            scissorsButton.isEnabled = true
            
            playAgainButton.isHidden = true
            opponentLabel.text = "😈"
        }
    }

    // This play() method will simulate a round of the game. This function is called when we press a Sign button on our screen, and we'll pass that move into this function. The CPU will make a move (through our randomSign() method in the Sign file), and we'll figure out the gameState by comparing our move with the opponent's.
    // Once we have a GameState, we'll update the UI accordingly and only display the button we used to make our move. We'll also unhide the Play Again button after we've made a move.
    func play(userSign: Sign) {
        let opponentSign = randomSign()
        let gameState = userSign.gameState(against: opponentSign)
        updateUI(for: gameState)
        opponentLabel.text = opponentSign.emoji
        
        rockButton.isHidden = true
        paperButton.isHidden = true
        scissorsButton.isHidden = true
        
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        
        switch userSign {
        case .rock:
            rockButton.isHidden = false
        case .paper:
            paperButton.isHidden = false
        case .scissors:
            scissorsButton.isHidden = false
        }
        playAgainButton.isHidden = false
    }
    
}

