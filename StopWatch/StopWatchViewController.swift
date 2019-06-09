//
//  StopWatchViewController.swift
//  StopWatch
//
//  Created by Zeeshan Zahoor on 9.06.2019.
//  Copyright © 2019 Zeeshan Zahoor. All rights reserved.
//

import UIKit;

class StopWatchViewController: UIViewController
{

    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    var timer = Timer();
    var isTimerRunning = false;
    var counter = 0.0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        resetButton.isEnabled = false;
        resetButton.alpha = 0.5;
        pauseButton.isEnabled = false;
        pauseButton.alpha = 0.5;
        
        resetButton.layer.cornerRadius = 10;
        pauseButton.layer.cornerRadius = pauseButton.bounds.width/2.0;
        startButton.layer.cornerRadius = startButton.bounds.width/2.0;
        startButton.layer.borderWidth = 2;
        pauseButton.layer.borderWidth = 2;
        
    }
    
    @IBAction func resetDidTap(_ sender: Any) {
        timer.invalidate();
        counter = 0;
        isTimerRunning = false;
        timerLabel.text = "00:00:00.0";
        
        resetButton.isEnabled = false;
        resetButton.alpha = 0.5;
        pauseButton.isEnabled = false;
        pauseButton.alpha = 0.5;
        startButton.isEnabled = true;
        startButton.alpha = 1.0;
        
    }
    
    @IBAction func startDidTap(_ sender: Any) {
        if(!isTimerRunning)
        {
            timer = Timer.scheduledTimer(timeInterval:0.1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true);
            isTimerRunning = true;
            
            resetButton.isEnabled = true;
            resetButton.alpha = 1.0;
            pauseButton.isEnabled = true;
            pauseButton.alpha = 1.0;
            startButton.isEnabled = false;
            startButton.alpha = 0.5;
            
        }
    }
    
    
    @IBAction func pauseDidTap(_ sender: Any) {
        resetButton.isEnabled = true;
        resetButton.alpha = 1.0;
        startButton.isEnabled = true;
        startButton.alpha = 1.0;
        pauseButton.isEnabled = false;
        pauseButton.alpha = 0.5;
        
        isTimerRunning = false;
        timer.invalidate();
    }
    
    @objc func runTimer()
    {
        counter+=0.1;
        timerLabel.text = "\(counter)";
        
        let flooredCounter = Int(floor(counter));
        let hour = flooredCounter / (3600);
        let minute = (flooredCounter % 3600)/60;
        let second = (flooredCounter % 3600)%60;
        let deci = String(format:"%.1f", counter).components(separatedBy: ".").last!
        
        let Text = String(format:"%02d:%02d:%02d", hour, minute, second);
        
        
        timerLabel.text = "\(Text).\(deci)";
        
    }
}
