//
//  SecondViewController.swift
//  HomeWork 7_tabBar
//
//  Created by Chinara on 5/1/23.
//

import UIKit

class SecondViewController: UIViewController {
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("GO", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)

        button.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview().inset(80)
        }
    }
    

    @objc func buttonTap() {
        navigationController?.pushViewController(ThirdViewController(), animated: true)
    }

}
