//
//  LeftMenu.swift
//  LeftSlideoutMenu
//
//  Created by Robert Chen on 8/5/15.
//  Copyright (c) 2015 Thorn Technologies. All rights reserved.
//

import UIKit

class LeftMenu : UITableViewController {
    
    var fruits = [Fruit]()
    var showRipeOnly = false
    
    var ripeFruits = [Fruit]()
    var selectedFruits = [Fruit]()
    @IBOutlet weak var fruitTable: UITableView!
    
    
    
   
    override func viewDidLoad() {
        self.fruits = []
        fruits.append(Fruit(name: "Apples", seasons: [7,8,9,10,11]))
        fruits.append(Fruit(name: "Apricot", seasons: [5,6]))
        fruits.append(Fruit(name: "Avocados", seasons: [11,12,1,2,4,5,6,7,8,9]))
        fruits.append(Fruit(name: "Blood Oranges", seasons: [12,1,2,3,4,5]))
        fruits.append(Fruit(name: "Figs", seasons: [7,8,9]))
        fruits.append(Fruit(name: "Grapefruit",seasons: [11,12,1,2,3,4,5,6,7,8,9]))
        fruits.append(Fruit(name: "Grapes", seasons: [5,6,7,8,9,10,11]))
        fruits.append(Fruit(name: "Guava", seasons: []))
        fruits.append(Fruit(name: "Kumquats", seasons: []))
        fruits.append(Fruit(name: "Lemons", seasons: [11,12,1,2,3,4,5,6,7,8,9,10]))
        fruits.append(Fruit(name: "Limes", seasons: []))
        fruits.append(Fruit(name: "Loquats", seasons: []))
        fruits.append(Fruit(name: "Nut Trees",seasons: []))
        fruits.append(Fruit(name: "Olives", seasons: []))
        fruits.append(Fruit(name: "Oranges", seasons: [11,12,1,2,3,4]))
        fruits.append(Fruit(name: "Peaches", seasons: [5,6,7,8,9]))
        fruits.append(Fruit(name: "Persimmons", seasons: []))
        fruits.append(Fruit(name: "Pineapple Guava", seasons: []))
        fruits.append(Fruit(name: "Plums", seasons: [5,6,7,8,9]))
        fruits.append(Fruit(name: "Pomegranates", seasons: [9,10,11]))
        fruits.append(Fruit(name: "Pomelos", seasons: []))
        fruits.append(Fruit(name: "Rosemary", seasons: []))
        fruits.append(Fruit(name: "Sapotes", seasons: []))
        fruits.append(Fruit(name: "Strawberry Guavas", seasons: []))
        fruits.append(Fruit(name: "Strawberries", seasons: [11,12,1,2,3,4,5,6,7,8,9,10]))
        fruits.append(Fruit(name: "Tangelos", seasons: []))
        
        setRipeFruits()
    }
    
    func setRipeFruits(){
   
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day , .Month , .Year], fromDate: date)
        let currentMonth = components.month
        

    
    
        for fruit in fruits{
            for month in fruit.seasons {
                if month == currentMonth{
                    ripeFruits.append(fruit)
                }
            }
        }
       
    }
    @IBAction func toggleRipeOnly(){
        if showRipeOnly == false{
            showRipeOnly = true
        }
        else if showRipeOnly == true{
            showRipeOnly = false
        }
        fruitTable.reloadData()
    }
    
}



// MARK: - UITableViewDelegate methods

extension LeftMenu {
   //for when someone clicks on it
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    
    }
}

// MARK: - UITableViewDataSource methods

extension LeftMenu {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(showRipeOnly == true){
            return ripeFruits.count
        }
        else{
            return fruits.count
        }
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        if(showRipeOnly == true){
            cell.textLabel?.text = ripeFruits[indexPath.row].name
        }
        else{
            cell.textLabel?.text = fruits[indexPath.row].name
        }
        return cell
    }
    
}