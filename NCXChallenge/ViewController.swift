//
//  ViewController.swift
//  NCXChallenge
//
//  Created by Maria Bruno on 25/03/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var agerangeTextField: UITextField!
    //    @IBOutlet weak var agerangeTextField: UITextField!
    @IBOutlet weak var trimesterTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var glycemiaTextField: UITextField!
    @IBOutlet weak var ldlTextField: UITextField!
    
    let ageranges = ["15-29", "30-39", "40-49"]
        let trimesters = ["1", "2", "3"]
        
        var agerangePickerView = UIPickerView()
        var trimesterPickerView = UIPickerView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        agerangeTextField.inputView = agerangePickerView
        trimesterTextField.inputView = trimesterPickerView
        
        agerangeTextField.placeholder = "Select Age range"
        trimesterTextField.placeholder = "Select Trimester"
        
        agerangePickerView.delegate = self
        agerangePickerView.dataSource = self
        trimesterPickerView.delegate = self
        trimesterPickerView.dataSource = self
        
        agerangePickerView.tag = 1
        trimesterPickerView.tag = 2
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        switch pickerView.tag {
        case 1:
            return ageranges.count
        case 2:
            return trimesters.count
        default:
            return 1
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return ageranges[row]
        case 2:
            return trimesters[row]
        default:
            return "Data not found."
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            agerangeTextField.text = ageranges[row]
            agerangeTextField.resignFirstResponder()
        case 2:
            trimesterTextField.text = trimesters[row]
            trimesterTextField.resignFirstResponder()
        default:
            return
        }
    }
}

