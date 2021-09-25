//
//  ViewController.swift
//  TasKagitMakas
//
//  Created by Halil Özel on 16.07.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var manager = Manager()
    var myPoints = 0
    var pcPoints = 0
    
    // MARK: - IBOutlets
    @IBOutlet weak var theEndLabel: UILabel!
    @IBOutlet weak var myPointsLabel: UILabel!
    @IBOutlet weak var pcPointsLabel: UILabel!
    

    // MARK: - IBActions
    @IBAction func rockSelected(_ sender: Any) {
        let pcSelected = manager.generateComputerMove()
        
        switch pcSelected {
            case .rock:
                alertWinner(wins: .tie, pcMove: pcSelected)
            case .paper:
                alertWinner(wins: .aiWin, pcMove: pcSelected)
                addPoints(player: .ai)
            case .scissors:
                alertWinner(wins: .humanWin, pcMove: pcSelected)
                addPoints(player: .human)
        }
    }
    
    
    // kağıt ile ilgili işlemler
    @IBAction func paperSelected(_ sender: Any) {
        let pcSelected = manager.generateComputerMove()
        
        switch pcSelected {
            case .rock:
                alertWinner(wins: .humanWin, pcMove: pcSelected)
                addPoints(player: .human)
            case .paper:
                alertWinner(wins: .tie, pcMove: pcSelected)
        case .scissors:
            alertWinner(wins: .aiWin, pcMove: pcSelected)
                addPoints(player: .ai)
        }
    }
    
    // makas ile ilgili işlemler
    @IBAction func scissorSelected(_ sender: Any) {
        let pcSelected = manager.generateComputerMove()
        switch pcSelected {
            case .rock:
                alertWinner(wins: .aiWin, pcMove: pcSelected)
                addPoints(player: .ai)
            case .paper:
                alertWinner(wins: .humanWin, pcMove: pcSelected)
                addPoints(player: .human)
            case .scissors:
                alertWinner(wins: .tie, pcMove: pcSelected)
        }
    }
    
    func addPoints(player : Players) {
        switch player {
            case .human:
                myPoints += 1
                myPointsLabel.text = String(myPoints)
            case .ai:
                pcPoints += 1
                pcPointsLabel.text = String(pcPoints)
        }
    }
    
    
    func alertWinner(wins : WinCombos, pcMove : Choices) {
        var title = ""
        switch wins {
            case .humanWin:
                title = "You Won!"
            case .aiWin:
                title = "The Computer Won!"
            case .tie:
                title = "It Was a Tie"
        }
        
        let alert = UIAlertController(title: title, message: "The computer chose: \(pcMove.rawValue)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }

}
