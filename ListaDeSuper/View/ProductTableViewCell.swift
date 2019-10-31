//
//  ProductTableViewCell.swift
//  ListaDeSuper
//
//  Created by Alejandro on 30/10/19.
//  Copyright © 2019 Alejandro Robles. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    let productLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let statusProductLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(productLabel)
        
        productLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        productLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        productLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width/1.5-10).isActive = true
        productLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        addSubview(statusProductLabel)
        
        statusProductLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        statusProductLabel.leftAnchor.constraint(equalTo: productLabel.rightAnchor, constant: 0).isActive = true
        statusProductLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width/3-10).isActive = true
        statusProductLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
