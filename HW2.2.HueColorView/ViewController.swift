//
//  ViewController.swift
//  HW2.2.HueColorView
//
//  Created by Vladislav on 17.10.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var hueColorViev: UIView!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeColor()
        changeValue()
    }

    func changeColor() {
        hueColorViev.backgroundColor = .init(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
    
    func changeValue() {
        redValueLabel.text = String(format: "%.2f", redSlider.value)
        greenValueLabel.text = String(format: "%.2f", greenSlider.value)
        blueValueLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
    @IBAction func colorChangeSlider() {
        changeColor()
        changeValue()
    }
    
}

