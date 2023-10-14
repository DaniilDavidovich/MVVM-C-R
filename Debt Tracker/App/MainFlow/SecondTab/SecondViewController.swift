//
//  SecondViewController.swift
//  Debt Tracker
//
//  Created by Daniil Davidovich on 26.09.23.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    var pushToDetail: () -> () = { }
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.buttonTitle, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .systemGray6
        view.addSubview(button)
        
        button.snp.makeConstraints { make in
            make.center.equalTo(view.center)
        }
    }
    
    @objc
    func buttonTapped() {
        pushToDetail()
    }
    
}

fileprivate enum Constants {
    static let buttonTitle = "Push".localised()
}
