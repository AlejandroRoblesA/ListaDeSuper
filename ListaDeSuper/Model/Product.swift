//
//  Product.swift
//  ListaDeSuper
//
//  Created by Alejandro on 30/10/19.
//  Copyright © 2019 Alejandro Robles. All rights reserved.
//

import Foundation

class Product: NSObject, NSSecureCoding{
    
    var nameProduct: String = ""
    var statusProduct: String = ""
    
    override init() {
        self.nameProduct = ""
        self.statusProduct = ""
    }
    
    init(name: String, status: String) {
        self.nameProduct = name
        self.statusProduct = status
    }
    
    func encode(with aCoder: NSCoder){
        aCoder.encode(self.nameProduct, forKey: "name")
        aCoder.encode(self.statusProduct, forKey: "status")
    }
    
    required init (coder decoder: NSCoder) {
        self.nameProduct = decoder.decodeObject(forKey: "name") as! String
        self.statusProduct = decoder.decodeObject(forKey: "status") as! String
    }
    
    func encodeWithCoder(coder: NSCoder){
        coder.encode(self.nameProduct, forKey: "name")
        coder.encode(self.statusProduct, forKey: "status")
    }
    
    static var supportsSecureCoding: Bool{
        true
    }
}
