//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Ravikiran Pathade on 1/15/18.
//  Copyright © 2018 Ravikiran Pathade. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var slowButtonVar: UIButton!
    @IBOutlet weak var fastButtonVar: UIButton!
    @IBOutlet weak var highPitchButtonVar: UIButton!
    @IBOutlet weak var reverbButtonVar: UIButton!
    @IBOutlet weak var echoButtonVar: UIButton!
    @IBOutlet weak var lowPitchButtonVar: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    enum ButtonType: Int{ case slow=0,fast, chipmunk, vader, echo , reverb }
    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    override func viewWillAppear(_ animated: Bool) {
        configureUI(.notPlaying)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func stopButtonFunc(_ sender: Any) {
        stopAudio()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
