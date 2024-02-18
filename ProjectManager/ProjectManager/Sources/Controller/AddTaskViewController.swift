//
//  AddTaskViewController.swift
//  ProjectManager
//
//  Created by Kiseok on 2/18/24.
//

import UIKit

final class AddTaskViewController: UIViewController {
    private let titleTextField: UITextField = {
        let textField: UITextField = .init()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Title"
        
        return textField
    }()
    private let dueDatePicker: UIDatePicker = {
        let datePicker: UIDatePicker = .init()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        
        return datePicker
    }()
    private let descriptionTextView: UITextView = {
        let textView: UITextView = .init()
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionTextView.delegate = self
        
        configureUI()
        setUpLayout()
    }
}

extension AddTaskViewController {
    private func configureUI() {
        self.view.addSubview(titleTextField)
        self.view.addSubview(dueDatePicker)
        self.view.addSubview(descriptionTextView)
    }
    
    private func setUpLayout() {
        NSLayoutConstraint.activate([
            self.titleTextField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 5),
            self.titleTextField.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            self.titleTextField.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 10),
            
            self.dueDatePicker.topAnchor.constraint(equalTo: self.titleTextField.bottomAnchor, constant: 20),
            
            self.descriptionTextView.topAnchor.constraint(equalTo: self.dueDatePicker.bottomAnchor, constant: 20),
            self.descriptionTextView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 20),
            self.descriptionTextView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            self.descriptionTextView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 10),
        ])
    }
}

extension AddTaskViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if textView.text.count > 1000 {
            return false
        }
        
        return true
    }
}
