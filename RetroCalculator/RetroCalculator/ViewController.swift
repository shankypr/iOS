//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Shashank.Rao on 11/3/16.
//  Copyright © 2016 Shashank.Rao. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var btnSound: AVAudioPlayer!
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var result = ""
    var currentOperation = Operation.Empty
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    
    @IBOutlet weak var outputLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        let path = Bundle.main.path(forResource: "btn", ofType:  "wav");
        let soundURL = URL(fileURLWithPath: path!);
        
        
        do {
            try btnSound = AVAudioPlayer(contentsOf: soundURL)
            btnSound.prepareToPlay()
            
        }catch let err as NSError{
            print(err.debugDescription)
        }
  
    }

    @IBAction func numberPressed(sender:UIButton) {
        playSound()
        runningNumber += "\(sender.tag)"
        outputLbl.text = runningNumber
    }
    
    func playSound() {
        if btnSound.isPlaying {
            btnSound.stop()
        }
        btnSound.play()
    }
    
    
    @IBAction func onDividePressed(sender:AnyObject) {
        playSound()
        processOperations(oper: .Divide)
    }
    @IBAction func onMultiplyPressed(sender:AnyObject) {
        playSound()
         processOperations(oper: .Multiply)
    }
    @IBAction func onAddPressed(sender:AnyObject) {
        playSound()
         processOperations(oper: .Add)
    }
    @IBAction func onSubtractPressed(sender:AnyObject) {
        playSound()
         processOperations(oper: .Subtract)
    }
    @IBAction func onEqualPressed(sender:AnyObject) {
        playSound()
         processOperations(oper: currentOperation)
    }
    
    func processOperations(oper:Operation) {
        if currentOperation != Operation.Empty {
            if runningNumber != "" {
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                    
                }else if currentOperation == Operation.Divide {
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                }else if currentOperation == Operation.Add {
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                }else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                }
                leftValStr = result;
                outputLbl.text = result;
                
            }
            currentOperation = oper;
            
            
        }
        else {
            leftValStr = runningNumber;
            runningNumber = ""
            currentOperation = oper
            
        }
        
    }
    

}

