//
//  ViewController.swift
//  HW2.2.HueColorView
//
//  Created by Vladislav on 17.10.2020.
//

import UIKit

class SetColorViewController: UIViewController, UITextFieldDelegate {
    //MARK: - IB Outlets
    
    @IBOutlet weak var hueColorView: UIView!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redValueTextField: UITextField!
    @IBOutlet weak var greenValueTextField: UITextField!
    @IBOutlet weak var blueValueTextField: UITextField!
    
    //MARK: - Public Properties
    var previewColor: UIView!
    var colorDelegete: SetColorViewControllerDelegate!
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        setSliderColor()
        setColor()
        setValue(for: redValueLabel, greenValueLabel, blueValueLabel)
        setValueText(for: redValueTextField, greenValueTextField, blueValueTextField)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    //MARK: - AB Action
    @IBAction func rgbSlider(_ sender: UISlider) {
        
        setColor()
        switch sender.tag {
        case 0:
            redValueLabel.text = string(from: sender)
            redValueTextField.text = string(from: sender)
        case 1:
            greenValueLabel.text = string(from: sender)
            greenValueTextField.text = string(from: sender)
        case 2:
            blueValueLabel.text = string(from: sender)
            blueValueTextField.text = string(from: sender)
        default: break
        }
    }
    
    @IBAction func rgbValueTextField(_ sender: UITextField) {

        let inputText = sender.text ?? ""
        if let value = Float(inputText) {
            switch sender.tag {
            case 0: redSlider.setValue(value, animated: true)
            case 1: greenSlider.setValue(value, animated: true)
            case 2: blueSlider.setValue(value, animated: true)
            default: break
            }
            setValue(for: redValueLabel, greenValueLabel, blueValueLabel)
            setValueText(for: redValueTextField, greenValueTextField, blueValueTextField)
            setColor()
        }
    }
    
    @IBAction func DoneButtonPressed() {
        colorDelegete.setColorFullScreenView(hueColorView)
        dismiss(animated: true)
    }
    
    //MARK: - Private Methods
    
    private func setSliderColor() {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        previewColor.backgroundColor?.getRed(&red,
                                             green: &green,
                                             blue: &blue,
                                             alpha: &alpha)
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
    }
    
    private func setColor() {
        hueColorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
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
    
    private func setValueText(for textField: UITextField...) {
        textField.forEach { textField in
            switch textField.tag {
            case 0: redValueTextField.text = string(from: redSlider)
            case 1: greenValueTextField.text = string(from: greenSlider)
            case 2: blueValueTextField.text = string(from: blueSlider)
            default: break
            }
        }
    }

    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }

}

