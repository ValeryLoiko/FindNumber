//
//  SettingsTableViewController.swift
//  FindNumber
//
//  Created by Valery on 15/05/2022.
//

import UIKit


class SettingsTableViewController: UITableViewController {
    
    @IBOutlet weak var switchTimer: UISwitch!
    @IBOutlet weak var secondsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadSettings()
    }
    
    @IBAction func changeTimerState(_ sender: UISwitch) {
        Settings.shared.currentSettings.timerState = sender.isOn
    }
    
    @IBAction func resetSettings(_ sender: UIButton) {
        Settings.shared.resetSettings()
        loadSettings()
    }
    
    private func loadSettings() {
        secondsLabel.text = "\(Settings.shared.currentSettings.timeForGame) sec"
        switchTimer.isOn = Settings.shared.currentSettings.timerState
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "selectTimeViewController":
            if let viewController = segue.destination as? SelectTimeViewController {
                viewController.data = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120]            }
        default:
            break
        }
    }
}
