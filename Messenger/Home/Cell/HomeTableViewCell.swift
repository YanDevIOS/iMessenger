//
//  HomeTableViewCell.swift
//  Messenger
//
//  Created by Yan Alejandro on 17/02/23.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    static let identifier: String = "HomeTableViewCell"
    
    lazy var homeCell: HomeCell = {
        let view = HomeCell()
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        configDescriptionCellConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        contentView.addSubview(homeCell)
    }

    
    public func setupCell(data: DataHome) {
        homeCell.nameLabel.text = data.name
        homeCell.userImageView.image = UIImage(named: data.nameImage)
    }
    
    func configDescriptionCellConstraints() {
        homeCell.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}
