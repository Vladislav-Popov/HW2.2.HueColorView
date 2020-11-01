//
//  MainColorViewController.swift
//  HW2.2.HueColorView
//
//  Created by Vladislav on 01.11.2020.
//

import UIKit

protocol SetColorViewControllerDelegate {
    func setColorFullScreenView(_ ColorView: UIView!)
}

class MainColorViewController: UIViewController {

    @IBOutlet var fullScreenColorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let setColorVC = segue.destination as! SetColorViewController
        setColorVC.colorDelegete = self
        setColorVC.previewColor = fullScreenColorView
    }
    
}

extension MainColorViewController: SetColorViewControllerDelegate {
    func setColorFullScreenView(_ ColorView: UIView!) {
        fullScreenColorView.backgroundColor = ColorView.backgroundColor
    }
    
    
}



