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
//        changeColor()
//        changeValue()
        
        setColor()
        setValue(for: redValueLabel, greenValueLabel, blueValueLabel)
    }

//    func changeColor() {
//        hueColorViev.backgroundColor = .init(
//            red: CGFloat(redSlider.value),
//            green: CGFloat(greenSlider.value),
//            blue: CGFloat(blueSlider.value),
//            alpha: 1)
//    }
//

    
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        switch sender.tag {
        case 0: redValueLabel.text = string(from: sender)
        case 1: greenValueLabel.text = string(from: sender)
        case 2: blueValueLabel.text = string(from: sender)
        default: break
        }
    }
    
    
    private func setColor() {
        hueColorViev.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label.tag {
            case 0: redValueLabel.text = string(from: redSlider)
            case 1: greenValueLabel.text = string(from: greenSlider)
            case 2: blueValueLabel.text = string(from: blueSlider)
            default: break
            }
        }
    }
    
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
}


