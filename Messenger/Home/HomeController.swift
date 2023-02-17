//
//  HomeController.swift
//  Messenger
//
//  Created by Yan Alejandro on 17/02/23.
//

import UIKit

class HomeController: UIViewController {
    
    var homeScreen: HomeScreen?
    var data: [DataHome] = [DataHome(name: "Yan", nameImage: "menino"),
                            DataHome(name: "Juliana", nameImage: "menina"),
                            DataHome(name: "Jarvan", nameImage: "menino1"),
                            DataHome(name: "Leona", nameImage: "menina1"),
                            DataHome(name: "Darius", nameImage: "menino2"),
                            DataHome(name: "Shyvana", nameImage: "menina2"),
                            DataHome(name: "Volibear", nameImage: "menino3"),
                            DataHome(name: "Kayle", nameImage: "menina3"),
    ]
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreen?.configTableViewProtocols(delegate: self, dataSource: self)
    }
}

extension HomeController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeTableViewCell? = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell
        cell?.setupCell(data: data[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
