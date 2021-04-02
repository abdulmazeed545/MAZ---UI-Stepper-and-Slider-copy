//
//  ViewController.swift
//  MAZ - UI-Stepper and Slider
//
//  Created by Shaik abdul mazeed on 12/12/20.
//  Copyright © 2020 Shaik abdul mazeed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Creating IBOutlets for switches
    @IBOutlet weak var T2BSwitch: UISwitch!
    
    @IBOutlet weak var B2TSwitch: UISwitch!
    
    @IBOutlet weak var L2RSwitch: UISwitch!
    
    @IBOutlet weak var R2LSwitch: UISwitch!
    //Creating global variables for slider,label and stepper
    var slider:UISlider!
    var stepper:UIStepper!
    var label:UILabel!
    var label1:UILabel!
    var labelArray:[UILabel] = []
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Setting a background image
       view.layer.contents = #imageLiteral(resourceName: "apple1").cgImage
        // Do any additional setup after loading the view.
        switchesOnOff()
        displayUI()
        
    }
    //Function for switches on off conditions
    func switchesOnOff()
    {
       T2BSwitch.addTarget(self, action: #selector(switchesOnOff1), for: UIControl.Event.valueChanged)
        T2BSwitch.addTarget(self, action: #selector(displayHorizontalLabels), for: UIControl.Event.valueChanged)
        
        B2TSwitch.addTarget(self, action: #selector(switchesOnOff2), for: UIControl.Event.valueChanged)
        B2TSwitch.addTarget(self, action: #selector(displayHorizontalLabels), for: UIControl.Event.valueChanged)
        L2RSwitch.addTarget(self, action: #selector(switchesOnOff3), for: UIControl.Event.valueChanged)
        L2RSwitch.addTarget(self, action: #selector(displayHorizontalLabels), for: UIControl.Event.valueChanged)
        R2LSwitch.addTarget(self, action: #selector(switchesOnOff4), for: UIControl.Event.valueChanged)
        R2LSwitch.addTarget(self, action: #selector(displayHorizontalLabels), for: UIControl.Event.valueChanged)
    }
    //Creating a function for switches on or off
    @objc func switchesOnOff1()
    {
        //Condtion to switch off
        if T2BSwitch.isOn == true
        {
            B2TSwitch.isOn = false
        }
    }
    //Creating a function for switches on or off
    @objc func switchesOnOff2()
    {
        //Condtion to switch off
        if B2TSwitch.isOn == true
        {
            T2BSwitch.isOn = false
        }
    }
    //Creating a function for switches on or off
    @objc func switchesOnOff3()
    {
        //Condtion to switch off
        if L2RSwitch.isOn == true
        {
            R2LSwitch.isOn = false
        }
    }
    //Creating a function for switches on or off
    @objc func switchesOnOff4()
    {
        //Condtion to switch off
        if R2LSwitch.isOn == true
        {
            L2RSwitch.isOn = false
        }
    }
    //Creating a function for to display slider,labels and stepper
    func displayUI()
    {
        //Creating an instance to the slider
        slider = UISlider(frame: CGRect(x: 20, y: 250, width: 180, height: 30))
        view.addSubview(slider)
        slider.minimumTrackTintColor = UIColor.systemGreen
        slider.maximumTrackTintColor = UIColor.systemRed
        slider.thumbTintColor = UIColor.systemOrange
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.addTarget(self, action: #selector(changeSlider), for: UIControl.Event.valueChanged)
        slider.addTarget(self, action: #selector(displayHorizontalLabels), for: UIControl.Event.valueChanged)
        
        
        //Creating an instance to the stepper
        stepper = UIStepper(frame: CGRect(x: 300, y: 250, width: 100, height: 100))
        view.addSubview(stepper)
        stepper.backgroundColor = UIColor.systemTeal
        stepper.minimumValue = 0
        stepper.maximumValue = 100
        stepper.addTarget(self, action: #selector(changeStepper), for: UIControl.Event.valueChanged)
        stepper.addTarget(self, action: #selector(displayHorizontalLabels), for: UIControl.Event.valueChanged)
        
        
        //Creating an instance to the label
        label = UILabel(frame: CGRect(x: 240, y: 250, width: 50, height: 30))
        label.text = "\(slider.value)"
        label.textAlignment = .center
        label.textColor = UIColor.black
        view.addSubview(label)
        label.backgroundColor = UIColor.systemYellow
        
        
    }
    @objc func changeSlider()
    {
        stepper.value = Double(slider.value)
        label.text = "\(Int(slider.value))"
    }
    @objc func changeStepper()
    {
        label.text = "\(Int(slider.value))"
        slider.setValue(Float(stepper.value), animated: true)
    }
    @objc func displayHorizontalLabels()
    {
        //Condition for switches on
        if (T2BSwitch.isOn == true && L2RSwitch.isOn == true)
        {
            loopsIteration(xAx: 0, yAx: 300)
        }
        //Condition for switches on
        if (T2BSwitch.isOn == true && R2LSwitch.isOn == true)
        {
            loopsIteration(xAx: 350, yAx: 300)
        }
        //Condition for switches on
        if (B2TSwitch.isOn == true && L2RSwitch.isOn == true)
        {
            loopsIteration(xAx: 0, yAx: 700)
        }
        //Condition for switches on
        if (B2TSwitch.isOn == true && R2LSwitch.isOn == true)
        {
           loopsIteration(xAx:350, yAx:700)
        }
        
    }
    //Creating a function for removing the labels view
    func removeLabelsView()
    {
        for i in 0..<labelArray.count
        {
            //Using the array index removing the super view
            labelArray[i].removeFromSuperview()
        }
    }
    //Creating a function for loops
    @objc func loopsIteration(xAx:Int, yAx:Int)
    {
        var x = 0
        var y = yAx
        
        removeLabelsView()
        //For loop for creating the number of labels
        for i in stride(from: 1, through: stepper.value, by: 1)
        {
            
            //Creating an instance to the UILabel
            label1 = UILabel()
            if L2RSwitch.isOn
            {
                label1.frame = CGRect(x: xAx+28*x, y: y, width: 30, height: 25)
                
            }else if R2LSwitch.isOn
            {
                label1.frame = CGRect(x: xAx-28*x, y: y, width: 30, height: 25)
            }
            
            label1.backgroundColor = UIColor.systemYellow
            label1.text = "\(Int(i))"
            label1.textAlignment = .center
            //Appending the created labels into an array
            labelArray.append(label1)
            view.addSubview(label1)
            //Incrementing the the x axis value
            x += 1
            //for loop to break the labels
            for j in stride(from: 14, through: slider.value, by: 14)
            {
                if (Int(i) == Int(j))
                {
                    x = 0
                    if T2BSwitch.isOn
                    {
                        //Increasing the y axis value
                        y += 40
                    }else if B2TSwitch.isOn
                    {
                        //Decreasing the y axis value
                        y -= 40
                    }
                    
                }
            }
        }
    }


}

