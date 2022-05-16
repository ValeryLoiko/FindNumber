//
//  RecordViewController.swift
//  FindNumber
//
//  Created by Valery on 16/05/2022.
//

import UIKit


class RecordViewController: UIViewController {
    
    @IBOutlet weak var recordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let record = UserDefaults.standard.integer(forKey: KeysUserDefaulds.recordGame)
        if record != 0 {
            recordLabel.text = "Your record \(record)"
        } else {
            recordLabel.text = "Record is not set"
        }
    }
    
    @IBAction func closeViewController(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
