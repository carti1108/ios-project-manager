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

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
