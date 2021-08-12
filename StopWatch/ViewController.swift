//
//  ViewController.swift
//  StopWatch
//
//  Created by 生越冴恵 on 2021/08/12.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var label:UILabel!
    @IBOutlet var hanteiLabel:UILabel!
    var count:Float=0.0
    var timer:Timer=Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        hanteiLabel.isHidden=true
    }
    @IBAction func start(){
        hanteiLabel.isHidden=true
        if !timer.isValid{
            timer=Timer.scheduledTimer(timeInterval: 0.01,
                                       target: self,
                                       selector: #selector(self.up),
                                       userInfo: nil,
                                       repeats: true)
        }
        
    }
    @IBAction func stop(){
        if timer.isValid{
            timer.invalidate()
            self.hantei()
        }
        
    }
    @IBAction func reset(){
        hanteiLabel.isHidden=true
        if timer.isValid{
            timer.invalidate()
        }
        count=0.0
        label.text=String(format: "%.2f", count)
    }
    @objc func up(){
        count += 0.01
        label.text=String(format: "%.2f", count)
    }
    @objc func hantei(){
        hanteiLabel.isHidden=false
        if 9.80<count,count<10.20{
            hanteiLabel.text="PERFECT"
        }else if 9.70<count,count<10.30{
            hanteiLabel.text="GREAT"
        }else if 9.50<count,count<10.50{
            hanteiLabel.text="GOOD"
        }else{
            hanteiLabel.text="BAD"
        }
    }


}

