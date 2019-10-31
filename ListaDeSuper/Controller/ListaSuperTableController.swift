//
//  ViewController.swift
//  ListaDeSuper
//
//  Created by Alejandro on 30/10/19.
//  Copyright © 2019 Alejandro Robles. All rights reserved.
//

import UIKit

class ListaSuper: UITableViewController {
    
    let cellId = "cellId"
    var products: [Product] = []
    
    //MARK: - Life cycle ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItems()
        setupTableView()
        retriveProduct()
        backgroundText()
    }
    
    //MARK: - Custom functions
    func setupTableView(){
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.backgroundColor = .black
        tableView.separatorColor = .white
        tableView.separatorInset.left = 0
    }
    
    func setupNavigationItems(){
        navigationItem.title = "Lista de super"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddProduct))
    }

    @objc func handleAddProduct(){
        
        let alert  = UIAlertController(title: "Agrega un producto", message: "", preferredStyle: .alert)
        let cancelButtonAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        let aceptButtonAction =  UIAlertAction(title: "Agregar", style: .default) { (alertAction) in
            
            let textFieldAlert = alert.textFields![0] as UITextField
            let productsToAdd = Product()
            if textFieldAlert.text != ""{
                productsToAdd.nameProduct = textFieldAlert.text!
                productsToAdd.statusProduct = ""
                self.products.append(productsToAdd)
                self.saveProduct()
                self.backgroundText()
                self.tableView.reloadData()
            }
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Nombre del producto"
        }
        alert.addAction(cancelButtonAction)
        alert.addAction(aceptButtonAction)
        
        self.present(alert,animated: true, completion: nil)
    }
    
    //MARK: - TableView
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = products[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ProductTableViewCell
        cell.productLabel.text = product.nameProduct
        cell.statusProductLabel.text = product.statusProduct
        cell.backgroundColor = .black
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        product.statusProduct = "Comprado"
        saveProduct()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let indexCell = indexPath.row
            products.remove(at: indexCell)
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveProduct()
            backgroundText()
        }
    }
    
    //MARK: - Label without products
    func backgroundText(){
        
        if products.count == 0{
                let noDataLabel = UILabel.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
                noDataLabel.text = "No has agregado ningún producto a la lista."
                noDataLabel.textAlignment = .center
            noDataLabel.textColor = UIColor.white
                self.tableView.backgroundView = noDataLabel
                self.tableView.separatorStyle = .none
            }
            else{
                self.tableView.backgroundView = nil
            }
            self.tableView.reloadData()
    }
    
    //MARK: - Data Persistence
    func saveProduct(){
        let defaults = UserDefaults.standard
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: products, requiringSecureCoding: false)
            defaults.set(data, forKey: "products")
        }
        catch{
            print("No se pudo guardar los datos")
        }
    }

    func retriveProduct(){
        
        let defaults = UserDefaults.standard
        if let data = defaults.object(forKey: "products") as? NSData {
            do {
                products = try NSKeyedUnarchiver.unarchivedObject(ofClasses: [NSArray.self, Product.self], from: data as Data) as! [Product]
            }catch {
                print("No se pudo recuperar los datos")
            }
        }
    }
}

