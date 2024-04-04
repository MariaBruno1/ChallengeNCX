//
//  ExamDetailVC.swift
//  NCXChallenge
//
//  Created by Maria Bruno on 04/04/24.
//

import UIKit

class ExamDetailVC: UIViewController {
    
    var exam: Exam?
    
   
    
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    required init?(coder: NSCoder, exam: Exam?) {
        self.exam = exam
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Observers for Keyboard events.
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        // Setup after loading the view.
        if let exam = exam {
            nameTextField.text = exam.name
            descriptionTextField.text = exam.description
        }
        
        updateSaveButtonState()
    }
    
    // Check if name and surname are empty to enable (or not) the save button
    func updateSaveButtonState() {
        let nameText = nameTextField.text ?? ""
        saveButton.isEnabled = !nameText.isEmpty
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        //updateSaveButtonState()
        return true
    }
    
    //Called when the user click on the view (outside the UITextField). Hides the keyboard.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
   
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "saveUnwind" else { return }
        let name = nameTextField.text?.capitalized ?? ""
        let description = descriptionTextField.text
        exam = Exam(name: name, description: description)
    }
    
}


