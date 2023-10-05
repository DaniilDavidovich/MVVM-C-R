//
//  FirstDetailViewController.swift
//  Debt Tracker
//
//  Created by Daniil Davidovich on 26.09.23.
//

import UIKit

class FirstDetailViewController: UIViewController {
    
    var viewModel: FirstTabViewModel?
    
    init(viewModel: FirstTabViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Name"
        textField.delegate = self
        return textField
    }()
    
    private lazy var earsTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Ears"
        textField.delegate = self
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "First Detail View Cotroller"
        view.backgroundColor = .white
        view.addSubview(nameTextField)
        view.addSubview(earsTextField)
        
        nameTextField.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        earsTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameTextField.snp.top).inset(50)
        }
    }
}

extension FirstDetailViewController: UITextFieldDelegate {
 
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == nameTextField {
            viewModel?.model.name = textField.text ?? ""
        } else {
            viewModel?.model.ears = Int(textField.text ?? "")
        }
    }
}
