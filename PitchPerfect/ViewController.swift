//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Ravikiran Pathade on 1/15/18.
//  Copyright © 2018 Ravikiran Pathade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var recordButtonVar: UIButton!
    
    @IBOutlet weak var stopButtonVar: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        stopButtonVar.isEnabled = false
    }
    @IBAction func recordButton(_ sender: Any) {
        stopButtonVar.isEnabled = true
        recordButtonVar.isEnabled = false
        statusLabel.text = "Reording in Progress"
    }
    
    @IBAction func stopButton(_ sender: Any) {
        stopButtonVar.isEnabled = false
        recordButtonVar.isEnabled = true
         statusLabel.text = "Tap to Record"
    }
}

