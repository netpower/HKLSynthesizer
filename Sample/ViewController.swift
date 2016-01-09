//
//  ViewController.swift
//  Sample
//
//  Created by 加藤寛人 on 2016/01/09.
//  Copyright © 2016年 Hirohito Kato. All rights reserved.
//

import UIKit
import KSLSynthesizer

class ViewController: UIViewController {

    @IBOutlet weak var _bpmLabel: UILabel!
    @IBOutlet weak var _bpmSlider: UISlider!

    let BPM_MIN = 30.0
    let BPM_MAX = 300.0

    let engine_ = AudioEngineIF()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sliderUpdated(_bpmSlider)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
    }

    @IBAction func setSounds(sender: AnyObject) {
        engine_.sounds = ["kick.wav", "snare.wav", "zap.wav", "noiz.wav"]
    }

    @IBAction func Start(sender: AnyObject) {
        engine_.start()
    }

    @IBAction func Stop(sender: AnyObject) {
        engine_.stop()
    }

    @IBAction func sliderUpdated(sender: UISlider) {
        let newBpm = (BPM_MAX * Double(sender.value)) + BPM_MIN
        engine_.tempo = newBpm
        _bpmLabel.text = String(newBpm)
    }
}
