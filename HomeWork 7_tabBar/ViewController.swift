//
//  ViewController.swift
//  HomeWork 7_tabBar
//
//  Created by Chinara on 5/1/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let searchBar: UISearchBar = {
        let search = UISearchBar()
        return search
    }()
    
    private let line: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Or select via map?"
        label.textColor = .systemBlue
        label.backgroundColor = .white
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        return label
    }()
    
    private let table: UITableView = UITableView()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Done", for: .normal)
        button.layer.cornerRadius = 22
        return button
    }()
    
    private var info: [Info] = [
        Info(name: "ABC Company", address: "US, LA"),
        Info(name: "Fast Company", address: "US, AR"),
        Info(name: "Right Company", address: "US, TX"),
        Info(name: "Transmira", address: "Raleigh, NC"),
        Info(name: "Dollaride", address: "Brooklyn, New York"),
        Info(name: "Ansa", address: "Berkeley, California"),
        Info(name: "Dataappraisal", address: "Washington, DISTRICT OF COLUMBIA"),
        Info(name: "Inboxbooster", address: "San Francisco"),
        Info(name: "Cardinalityai", address: "Durham, NC"),
        Info(name: "Engin Sciences", address: "Raleigh, NC")
    ]
    private var filteredInfo: [Info] = []
    private var isFiltered: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(searchBar)
        view.addSubview(line)
        view.addSubview(label)
        view.addSubview(table)
        view.addSubview(button)
        
        table.dataSource = self
        searchBar.delegate = self
        constraints()
    }
    private func constraints () {
        searchBar.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(19)
            make.top.equalToSuperview().inset(100)
        }
        
        line.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.trailing.leading.equalToSuperview().inset(19)
            make.top.equalTo(searchBar.snp.bottom).offset(40)
            make.top.equalTo(searchBar.snp.bottom).offset(40)
        }
        label.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
        }
        table.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(button.snp.top).offset(-60)
        }
        button.snp.makeConstraints { make in
            make.height.equalTo(45)
            make.trailing.leading.equalToSuperview().inset(19)
            make.bottom.equalToSuperview().offset(-100)
        }
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltered ? filteredInfo.count : info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = isFiltered ? filteredInfo[
            indexPath.row].name : info[indexPath.row].name
        cell.detailTextLabel?.text = isFiltered ? filteredInfo[indexPath.row].address : info[indexPath.row].address
        return cell
        
    }
}

extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isFiltered = false
        } else {
            isFiltered = true
            
            filteredInfo = info.filter{ $0.address.contains(searchText)
            }
        }
        table.reloadData()
    }
    struct Info {
        var name: String
        var address: String
        
    }
}
