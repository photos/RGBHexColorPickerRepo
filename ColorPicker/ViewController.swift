//
//  ViewController.swift
//  ColorPicker
//
//  Created by Forrest Collins on 2/10/16.
//  Copyright © 2016 helloTouch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //-------------------
    // MARK: - UI Outlets
    //-------------------
    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var hexLabel: UILabel!
    
    // hide status bar
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    var redColor: Float = 0
    var greenColor: Float = 0
    var blueColor: Float = 0

    @IBAction func redSliderAction(sender: UISlider) {
        setColors()
    }

    @IBAction func greenSliderAction(sender: UISlider) {
        setColors()
    }
    
    @IBAction func blueSliderAction(sender: AnyObject) {
        setColors()
    }
    
    //-------------------
    // MARK: - Set Colors
    //-------------------
    func setColors() {
        redColor = sliderRed.value
        greenColor = sliderGreen.value
        blueColor = sliderBlue.value
        
        setLabels()
        changeLabelColor()
    }
    
    //-------------------
    // MARK: - Set Labels
    //-------------------
    func setLabels() {
        
        // this is the best way to round!
        let fRedColor = String(format: "%0.0f", (redColor * 255))
        let fGreenColor = String(format: "%0.0f", (greenColor * 255))
        let fBlueColor = String(format: "%0.0f", (blueColor * 255))
        let rgb:Int = (Int)(redColor*255)<<16 | (Int)(greenColor*255)<<8 | (Int)(blueColor*255)<<0

        redLabel.text = "Red: \(fRedColor)"
        greenLabel.text = "Green: \(fGreenColor)"
        blueLabel.text = "Blue: \(fBlueColor)"
        hexLabel.text = "Hex: \(NSString(format:"#%06x", rgb))"
    }
    
    //---------------------------
    // MARK: - Change Label Color
    //---------------------------
    func changeLabelColor() {
        
        self.view.backgroundColor = UIColor(red: CGFloat(redColor), green: CGFloat(greenColor), blue: CGFloat(blueColor), alpha: 1.0)
    }
}

