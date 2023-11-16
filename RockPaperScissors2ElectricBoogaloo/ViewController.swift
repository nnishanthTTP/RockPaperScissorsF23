//
//  ViewController.swift
//  RockPaperScissors2ElectricBoogaloo
//
//  Created by Nidhin Nishanth on 11/16/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var opponentLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    
    @IBOutlet var rockButton: UIButton!
    @IBOutlet var paperButton: UIButton!
    @IBOutlet var scissorsButton: UIButton!
    
    @IBOutlet var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI(for: .start)
    }
    
    @IBAction func rockChosen(_ sender: Any) {
        play(userSign: .rock)
    }
    
    @IBAction func paperChosen(_ sender: Any) {
        play(userSign: .paper)
    }
    
    @IBAction func scissorsChosen(_ sender: Any) {
        play(userSign: .scissors)
    }
    
    @IBAction func playAgain(_ sender: Any) {
        updateUI(for: .start)
    }
    
    func updateUI(for state: GameState) {
        switch state {
        case .win:
            statusLabel.text = "You win :)"
            view.backgroundColor = .green
        case .lose:
            statusLabel.text = "Do better"
            view.backgroundColor = .red
        case .draw:
            statusLabel.text = "Wow"
            view.backgroundColor = .lightGray
        case .start:
            statusLabel.text = "Rock, Paper, Scissors?"
            view.backgroundColor = .gray
            
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

