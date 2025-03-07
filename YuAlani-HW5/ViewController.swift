// Project: YuAlani-HW5
// EID: ay7892
// Course: CS329E
//  ViewController.swift
//  YuAlani-HW5
//
//  Created by Alani Yu on 2/27/25.
//

import UIKit

protocol addNewPizza {
    func addPizza(pizza: Pizza)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, addNewPizza{
   
    @IBOutlet weak var pizzaTableView: UITableView!
    
    let textCellIdentifier = "TableCell"
    let pizzaSegue = "PizzaSegue"
    
    var pizzaList:[Pizza] = [] // stores the pizzas

    override func viewDidLoad() {
        super.viewDidLoad()
        pizzaTableView.delegate = self
        pizzaTableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(pizzaList.count)
        return pizzaList.count
    }
    
    // fills the text cell with the pizza details using the pizza's toString method
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for:indexPath as IndexPath)
        cell.textLabel?.text = pizzaList[indexPath.row].toString()
        
        return cell
    }
    
    // prepares the pizza segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "PizzaSegue",
            let pizzaVC = segue.destination as? PizzaCreationVC {
            pizzaVC.delegate = self
        }
    }
    
    // adds a pizza to the pizzaList array
    func addPizza(pizza: Pizza){
        pizzaList.append(pizza)
        self.pizzaTableView.reloadData()
        //print(pizzaList.count)
    }
}

