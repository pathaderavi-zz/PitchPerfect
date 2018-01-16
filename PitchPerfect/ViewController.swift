//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Ravikiran Pathade on 1/15/18.
//  Copyright © 2018 Ravikiran Pathade. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController , AVAudioRecorderDelegate{
    
    
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
       configureUIforRecord(state: false)
    }
    @IBAction func recordButton(_ sender: Any) {
       configureUIforRecord(state: true)
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
    }
    
    @IBAction func stopButton(_ sender: Any) {
        configureUIforRecord(state: false)
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    func configureUIforRecord(state: Bool){
        if state{
            stopButtonVar.isEnabled = true
            recordButtonVar.isEnabled = false
            statusLabel.text = "Recording in progress"
        }else{
            stopButtonVar.isEnabled = false
            recordButtonVar.isEnabled = true
            statusLabel.text = "Tap to Record"
        }
    }
    //MARK: Override audioRecorder is Finished
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag{
            performSegue(withIdentifier: "recordedSegue", sender: audioRecorder.url)
        }else{
            print("failed")
        }
    }
    //Prepare for Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="recordedSegue"){
                let playSoundsVC = segue.destination as! PlaySoundsViewController
                let recordedAudioUrl = sender as! URL
                playSoundsVC.recordedAudioURL = recordedAudioUrl
        }
    }
}

