//
//  menuTableVC.swift
//  Online Parking Project
//
//  Created by AJAY BAJWA on 2018-11-08.
//  Copyright © 2018 lambton. All rights reserved.
//

import UIKit

class menuTableVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return section == 0 ? 3 : 4
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.indexPathForSelectedRow?.section==0{

            if indexPath.row==0{
                let MenuSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let MenuVC = MenuSB.instantiateViewController(withIdentifier: "ParkingPaymentReceiptScreen")
                navigationController?.pushViewController(MenuVC, animated: true)
            }
            if indexPath.row==1{
                let MenuSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let MenuVC = MenuSB.instantiateViewController(withIdentifier: "ParkingReportScreen")
                navigationController?.pushViewController(MenuVC, animated: true)
            }
            if indexPath.row==2{
                let MenuSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let MenuVC = MenuSB.instantiateViewController(withIdentifier: "ParkingLocationScreen")
                navigationController?.pushViewController(MenuVC, animated: true)
            }
        }
        else if tableView.indexPathForSelectedRow?.section==1{
            if indexPath.row==0{
                let MenuSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let MenuVC = MenuSB.instantiateViewController(withIdentifier: "UserProfileScreen")
                navigationController?.pushViewController(MenuVC, animated: true)
            }
            if indexPath.row==1{
                let menuSB: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let menuVC = menuSB.instantiateViewController(withIdentifier: "GuideScreen")
                navigationController?.pushViewController(menuVC, animated: true)
            }
            if indexPath.row==2{
                let menuSB: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let menuVC = menuSB.instantiateViewController(withIdentifier: "ContactSupportScreen")
                navigationController?.pushViewController(menuVC, animated: true)
            }
            if indexPath.row==3{
                let menuSB: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let menuVC = menuSB.instantiateViewController(withIdentifier: "LoginScreen")
                navigationController?.pushViewController(menuVC, animated: true)
                logOut()
            }
        
        }
    }
    func logOut(){
        UserDefaults.standard.removeObject(forKey: "userId")
        //UserDefaults.standard.removeObject(forKey: "Password")
        let logOutAlert=UIAlertController(title: "Log Out Alert!", message: "You have Succesfully Logged Out", preferredStyle: .alert)
        logOutAlert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(logOutAlert, animated: true, completion: nil)
    }


    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
