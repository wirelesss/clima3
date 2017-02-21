//
//  TVC.swift
//  Clima3
//
//  Created by Rodrigo on 19/02/17.
//  Copyright © 2017 Rodrigo Hernandez. All rights reserved.
//

import UIKit

class TVC: UITableViewController {
    // Codigos Antiguos
    // Caracas  VEXX0008
    // Paris    FRXX0076
    // Grenoble FRXX0153
    // -----------------------
    // Codigos NUEVOS
    // Caracas  395269
    // Paris    615702
    // Grenoble 593720
    // -----------------------
    
    private var ciudades:Array<Array<String>> = Array<Array<String>>()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Clima de Ciudades"
        
        self.ciudades.append(["Caracas", "395269"])
        self.ciudades.append(["Paris",   "615702"])
        self.ciudades.append(["Grenoble", "593720"])
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.ciudades.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Celda", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = self.ciudades[indexPath.row][0]
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let controlCiudad = segue.destination as! ControlCiudad
        
        let indexPath = self.tableView.indexPathForSelectedRow
        
        controlCiudad.codigo = self.ciudades[indexPath!.row][1]
    }
 

}
