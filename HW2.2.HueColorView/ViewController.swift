//
//  ViewController.swift
//  HW2.2.HueColorView
//
//  Created by Vladislav on 17.10.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var hueColorViev: UIView!
    
    
    
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeColor()
    }

    func changeColor() {
        hueColorViev.backgroundColor = .init(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
    
    func valueOfColors() {
        
    }
    
    @IBAction func colorChangeSlider() {
        changeColor()
    }
    
}

