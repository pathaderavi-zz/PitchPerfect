//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Ravikiran Pathade on 1/15/18.
//  Copyright © 2018 Ravikiran Pathade. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var recordButtonVar: UIButton!
    @IBOutlet weak var stopButtonVar: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    var audioRecorder: AVAudioRecorder!
    
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
        if(audioRecorder != nil){
            audioRecorder.stop()
            
        }
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    @IBAction func recordAudio(_ sender: AnyObject) {
        statusLabel.text = "Recording in progress"
        stopButtonVar.isEnabled = true
        recordButtonVar.isEnabled = false
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
}

