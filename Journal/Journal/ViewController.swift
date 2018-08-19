//
//  ViewController.swift
//  Journal
//
//  Created by Invariant Telecom on 19/8/18.
//  Copyright © 2018 Md Abdul Gafur. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource , UITableViewDelegate{
    
    

    @IBOutlet weak var displayTableView: UITableView!
    
    var items: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayTableView.delegate = self 
    }
    
    override func viewWillAppear(_ animated: Bool) {
       self.fetchData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func fetchData() {
        do {
           let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
           items = try context.fetch(Item.fetchRequest())
            print(items[0].name!)
        } catch {
            print("Couldn't Fetch Data");
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "journal")!
        cell.textLabel?.text = items[indexPath.row].name
        return cell
    }
    

}

