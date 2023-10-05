//
//  ViewController.swift
//  Debt Tracker
//
//  Created by Daniil Davidovich on 25.09.23.
//

import UIKit


class FirstViewController: UIViewController {
    
    var pushCloser: () -> () = { }
    
    var viewModel: FirstTabViewModel?
    
    init(viewModel: FirstTabViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        label.text = "Yor Name: \(viewModel?.model.name ?? "" )\nYour Age: \(viewModel?.model.age ?? 0)"
    }
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Push", for: .normal)
        button.addTarget(self, action: #selector(pushToFirstDetail), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        view.addSubview(label)
        view.addSubview(button)
        
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(button.snp.top).inset(-50)
        }
        
        button.snp.makeConstraints { make in
            make.center.equalTo(view.center)
        }
    }
    
    @objc func pushToFirstDetail() {
        pushCloser()
    }
}

