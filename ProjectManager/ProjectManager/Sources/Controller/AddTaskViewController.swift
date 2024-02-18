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

    }
    
    }

}
