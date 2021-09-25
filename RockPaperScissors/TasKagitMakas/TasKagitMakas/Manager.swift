//
//  Manager.swift
//  TasKagitMakas
//
//  Created by Lourdes Zekkani on 9/6/21.
//  Copyright © 2021 Halil Özel. All rights reserved.
//

import UIKit

enum Choices : String, CaseIterable {
    case rock = "Rock"
    case paper = "Paper"
    case scissors = "Scissors"
}

enum Players {
    case human
    case ai
}

enum WinCombos {
    case humanWin
    case aiWin
    case tie
}

class Manager {
    public func generateComputerMove() -> Choices {
        return Choices.allCases.randomElement()!
    }
}


