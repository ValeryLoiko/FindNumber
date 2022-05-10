//
//  GameViewController.swift
//  Find Number
//
//  Created by Diana on 04/11/2021.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var statusGameLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var nextDigit: UILabel!
    
    lazy var game = Game(countItems: buttons.count)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUserInterface()
    }
    
    @IBAction func pressButton(_ sender: UIButton) {
        guard let buttonIndex = buttons.firstIndex(of: sender) else { return }
        game.check(index: buttonIndex)
        updateUI()
        
        
    }
    
    private func updateUserInterface() {
        
        
        for index in game.items.indices{
            buttons[index].setTitle(game.items[index].title, for: .normal)
            buttons[index].isHidden = false
        }
        nextDigit.text = game.nextItem?.title
    }
    
   private func updateUI() {
       for index in game.items.indices {
           buttons[index].isHidden = game.items[index].isFound
       }
       nextDigit.text = game.nextItem?.title

       if game.status == .win {
           statusGameLabel.text = "Вы выйграли"
           statusGameLabel.textColor = .red
       }
    }
    
}
