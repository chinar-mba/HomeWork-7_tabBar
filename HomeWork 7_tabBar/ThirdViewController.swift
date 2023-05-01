//
//  ThirdViewController.swift
//  HomeWork 7_tabBar
//
//  Created by Chinara on 5/1/23.
//

import UIKit

class ThirdViewController: UIViewController {
    private let label: UILabel = {
        let label = UILabel()
        label.text = "It's a pink day !!"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        view.addSubview(label)

        label.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            
        }
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
