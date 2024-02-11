// ContactInfoViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран добавления нового человека  в список
final class ContactInfoViewController: UIViewController {
    // MARK: - Lazy Properties

    private lazy var userImageView: UIImageView = {
        let element = UIImageView()
        element.frame = CGRect(x: 125, y: 66, width: 125, height: 125)
        element.image = UIImage(named: "fakePhoto")
        return element
    }()

    private lazy var changePhotoButton: UIButton = {
        let element = UIButton(type: .system)
        element.setTitle("Change photo", for: .normal)
        element.tintColor = #colorLiteral(red: 0.2235294118, green: 0.6705882353, blue: 0.9137254902, alpha: 1)
        element.frame = CGRect(x: 125, y: 199, width: 125, height: 20)
        return element
    }()

    private lazy var nameLabel: UILabel = {
        let element = UILabel()
        element.text = "Name Surname"
        element.font = UIFont(name: "Verdana-Bold", size: 16)
        element.frame = CGRect(x: 20, y: 239, width: 175, height: 20)
        return element
    }()

    private lazy var nameTextField: UITextField = {
        let element = UITextField()
        element.frame = CGRect(x: 20, y: 268, width: 250, height: 17)
        element.placeholder = "Typing Name Surname"
        element.borderStyle = .none
        return element
    }()

    private lazy var nameSeparator: UIView = {
        let element = UIView()
        element.frame = CGRect(x: 20, y: 293, width: 335, height: 1)
        element.backgroundColor = .gray
        return element
    }()

    private lazy var birthdayLabel: UILabel = {
        let element = UILabel()
        element.text = "Birthday"
        element.font = UIFont(name: "Verdana-Bold", size: 16)
        element.frame = CGRect(x: 20, y: 314, width: 175, height: 20)
        return element
    }()

    private lazy var birthdayTextField: UITextField = {
        let element = UITextField()
        element.frame = CGRect(x: 20, y: 343, width: 250, height: 17)
        element.placeholder = "Typing Date of Birth"
        element.borderStyle = .none
        element.inputView = birthdayDatePicker
        element.delegate = self
        return element
    }()

    private lazy var birthdaySeparator: UIView = {
        let element = UIView()
        element.frame = CGRect(x: 20, y: 368, width: 335, height: 1)
        element.backgroundColor = .gray
        return element
    }()

    private lazy var ageLabel: UILabel = {
        let element = UILabel()
        element.text = "Age"
        element.font = UIFont(name: "Verdana-Bold", size: 16)
        element.frame = CGRect(x: 20, y: 389, width: 175, height: 20)
        return element
    }()

    private lazy var ageTextField: UITextField = {
        let element = UITextField()
        element.frame = CGRect(x: 20, y: 418, width: 250, height: 17)
        element.placeholder = "Typing Age"
        element.borderStyle = .none
        element.inputView = agePickerView
        element.delegate = self
        element.inputAccessoryView = toolbar
        return element
    }()

    private lazy var ageSeparator: UIView = {
        let element = UIView()
        element.frame = CGRect(x: 20, y: 443, width: 335, height: 1)
        element.backgroundColor = .gray
        return element
    }()

    private lazy var genderLabel: UILabel = {
        let element = UILabel()
        element.text = "Gender"
        element.font = UIFont(name: "Verdana-Bold", size: 16)
        element.frame = CGRect(x: 20, y: 462, width: 175, height: 20)
        return element
    }()

    private lazy var genderTextField: UITextField = {
        let element = UITextField()
        element.frame = CGRect(x: 20, y: 491, width: 250, height: 17)
        element.placeholder = "Indicate Gender"
        element.borderStyle = .none
        element.inputView = genderPickerView
        element.delegate = self
        element.inputAccessoryView = toolbar
        return element
    }()

    private lazy var genderSeparator: UIView = {
        let element = UIView()
        element.frame = CGRect(x: 20, y: 516, width: 335, height: 1)
        element.backgroundColor = .gray
        return element
    }()

    private lazy var telegramLabel: UILabel = {
        let element = UILabel()
        element.text = "Telegram"
        element.font = UIFont(name: "Verdana-Bold", size: 16)
        element.frame = CGRect(x: 20, y: 537, width: 175, height: 20)
        return element
    }()

    private lazy var telegramTextField: UITextField = {
        let element = UITextField()
        element.frame = CGRect(x: 20, y: 566, width: 250, height: 17)
        element.placeholder = "Typing Telegram"
        element.borderStyle = .none
        element.delegate = self
        return element
    }()

    private lazy var telegramSeparator: UIView = {
        let element = UIView()
        element.frame = CGRect(x: 20, y: 591, width: 335, height: 1)
        element.backgroundColor = .gray
        return element
    }()

    private lazy var ages = Array(1 ... 100)
    private lazy var genders = ["Male", "Female"]

    private lazy var agePickerView: UIPickerView = {
        let element = UIPickerView()
        element.delegate = self
        element.dataSource = self
        element.backgroundColor = .white
        return element
    }()

    private lazy var genderPickerView: UIPickerView = {
        let element = UIPickerView()
        element.delegate = self
        element.dataSource = self
        element.backgroundColor = .white
        return element
    }()

    private lazy var birthdayDatePicker: UIDatePicker = {
        let element = UIDatePicker()
        element.datePickerMode = .date
        element.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
        element.preferredDatePickerStyle = .wheels
        element.backgroundColor = .white
        return element
    }()

    private lazy var toolbar: UIToolbar = {
        let toolbar = UIToolbar()
        let doneButton = UIBarButtonItem(title: "OK", style: .plain, target: self, action: #selector(okButtonTapped))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.sizeToFit()
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        return toolbar
    }()

    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarSetup()
        addViews()
        setupView()
        pickersSetup()
        setupPickerToolbar()
    }
}

// MARK: - UITextFieldDelegate

extension ContactInfoViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == telegramTextField {
            showTelegramAlert()
            return false
        }
        return true
    }
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource

extension ContactInfoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.isEqual(agePickerView) {
            return ages.count
        } else if pickerView.isEqual(genderPickerView) {
            return genders.count
        } else {
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.isEqual(agePickerView) {
            return "\(ages[row])"
        } else if pickerView.isEqual(genderPickerView) {
            return genders[row]
        } else {
            return nil
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.isEqual(agePickerView) {
            ageTextField.text = "\(ages[row])"
        } else if pickerView.isEqual(genderPickerView) {
            genderTextField.text = genders[row]
        }
    }
}

// MARK: - Private Methods

extension ContactInfoViewController {
    private func setupPickerToolbar() {
        let doneButton = UIBarButtonItem(title: "OK", style: .plain, target: self, action: #selector(okButtonTapped))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.sizeToFit()
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
    }

    private func setupView() {
        view.backgroundColor = .white
    }

    private func addViews() {
        view.addSubview(userImageView)
        view.addSubview(changePhotoButton)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(nameSeparator)
        view.addSubview(birthdayLabel)
        view.addSubview(birthdayTextField)
        view.addSubview(birthdaySeparator)
        view.addSubview(ageLabel)
        view.addSubview(ageTextField)
        view.addSubview(ageSeparator)
        view.addSubview(genderLabel)
        view.addSubview(genderTextField)
        view.addSubview(genderSeparator)
        view.addSubview(telegramLabel)
        view.addSubview(telegramTextField)
        view.addSubview(telegramSeparator)
    }

    private func navigationBarSetup() {
        let cancelButton = UIButton(type: .system)
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        cancelButton.frame = CGRect(x: 20, y: 15, width: 50, height: 20)

        let addButton = UIButton(type: .system)
        addButton.setTitle("Add", for: .normal)
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        addButton.frame = CGRect(x: 325, y: 15, width: 50, height: 20)

        view.addSubview(cancelButton)
        view.addSubview(addButton)
    }

    private func pickersSetup() {
        agePickerView.delegate = self
        agePickerView.dataSource = self

        genderPickerView.delegate = self
        genderPickerView.dataSource = self

        birthdayDatePicker.datePickerMode = .date
        birthdayDatePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
    }

    private func showTelegramAlert() {
        let alertController = UIAlertController(
            title: "Please enter Telegram",
            message: nil,
            preferredStyle: .alert
        )

        alertController.addTextField { textField in
            textField.placeholder = "Telegram"
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            if let textField = alertController.textFields?.first, let telegram = textField.text {
                self.telegramTextField.text = telegram
            }
        }
        alertController.addAction(okAction)
        alertController.preferredAction = okAction
        present(alertController, animated: true, completion: nil)
    }

    @objc private func cancelButtonTapped() {
        dismiss(animated: true)
    }

    @objc private func addButtonTapped() {}

    @objc private func datePickerValueChanged() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        birthdayTextField.text = dateFormatter.string(from: birthdayDatePicker.date)
    }

    @objc private func okButtonTapped() {
        ageTextField.resignFirstResponder()
        genderTextField.resignFirstResponder()
    }
}
