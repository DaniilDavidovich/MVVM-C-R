//
//  SecondDetailViewController.swift
//  Debt Tracker
//
//  Created by Daniil Davidovich on 26.09.23.
//

import UIKit

class SecondDetailViewController: UIViewController {
    
    var showOnboardingFlow: () -> () = { }
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.buttonTitle, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        view.addSubview(button)
        
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    @objc
    func buttonTapped() {
        showOnboardingFlow()
    }
    
}

fileprivate enum Constants {
    static let buttonTitle = "Go to Onboarding Flow".localised()
}
