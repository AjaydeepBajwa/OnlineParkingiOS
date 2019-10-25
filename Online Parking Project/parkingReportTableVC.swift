//
//  parkingReportTableVC.swift
//  Online Parking Project
//
//  Created by AJAY BAJWA on 2018-11-16.
//  Copyright © 2018 lambton. All rights reserved.
//

import UIKit

class parkingReportTableVC: UITableViewController {
var ParkingReportplistArray = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchValuesFromPlist()
        tableView.rowHeight = 450
        self.navigationController!.setNavigationBarHidden(false, animated: true)
        self.title = "Parking Ticket"

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.ParkingReportplistArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ParkingReportCell", for: indexPath) as! parkingReportTVCell
        
        // Configure the cell...
        let dictParkingReport = ParkingReportplistArray[indexPath.row] as! NSMutableDictionary
        print("\(ParkingReportplistArray)")
        print(" dictionary : \(dictParkingReport)")
        cell.lblEmail?.text = dictParkingReport.value(forKey: "Email") as? String
        cell.lblCarPlateNumber?.text = dictParkingReport.value(forKey: "CarPlateNumber") as? String
        cell.lblCarCompany?.text = dictParkingReport.value(forKey: "CarCompany") as? String
        if cell.lblCarCompany.text == "Toyota"{
            cell.imgCarCompany.image = UIImage(named: "toyota.png")
        }
        if cell.lblCarCompany.text == "BMW"{
            cell.imgCarCompany.image = UIImage(named: "bmw.png")
        }
        if cell.lblCarCompany.text == "Jaguar"{
            cell.imgCarCompany.image = UIImage(named: "jaguar.png")
        }
        if cell.lblCarCompany.text == "Volkswagen"{
            cell.imgCarCompany.image = UIImage(named: "volkswagen.png")
        }
        if cell.lblCarCompany.text == "Mercedes"{
            cell.imgCarCompany.image = UIImage(named: "mercedes.png")
        }
        if cell.lblCarCompany.text == "Honda"{
            cell.imgCarCompany.image = UIImage(named: "honda.png")
        }
        if cell.lblCarCompany.text == "Jeep"{
            cell.imgCarCompany.image = UIImage(named: "jeep.png")
        }
        if cell.lblCarCompany.text == "Suzuki"{
            cell.imgCarCompany.image = UIImage(named: "suzuki.png")
        }
        //cell.lblEntryTime?.text = dictParkingReport.value(forKey: "EntryTime") as? String
        //cell.lblExitTime?.text = dictParkingReport.value(forKey: "ExitTime") as? String
        cell.lblHoursParked.text = dictParkingReport.value(forKey: "HoursParked") as? String
        cell.lblDateTime?.text = dictParkingReport.value(forKey: "DateAndTime") as? String
        cell.lblLotNumber?.text = dictParkingReport.value(forKey: "LotNumber") as? String
        cell.lblSpotNumber?.text = dictParkingReport.value(forKey: "SpotNumber") as? String
        cell.lblCarColor?.text = dictParkingReport.value(forKey: "CarColor") as? String
        cell.lblPaymentMethod?.text = dictParkingReport.value(forKey: "PaymentMethod") as? String
        cell.lblPaymentAmount?.text = dictParkingReport.value(forKey: "PaymentAmount") as? String
        
        
        print("\(String(describing: cell.lblCarPlateNumber.text))")
        print("\(String(describing: dictParkingReport.value(forKey: "Email")))")
        print("\(String(describing: dictParkingReport.value(forKey: "CarPlateNumber")))")
        print("\(String(describing: dictParkingReport.value(forKey: "CarCompany")))")
        print("\(String(describing: dictParkingReport.value(forKey: "EntryTime")))")
        return cell
    }
    func fetchValuesFromPlist(){
        if let filePath = Bundle.main.path(forResource: "ParkingReport", ofType: "plist") {
            
            //get an array representation of plist
            ParkingReportplistArray = NSMutableArray(contentsOfFile: filePath)!
            
            print("ParkingReportplistArray \(ParkingReportplistArray)")
        }
    }
    /*func createPdfFromTableView()
    {
        let priorBounds: CGRect = self..bounds
        let fittedSize: CGSize = self..sizeThatFits(CGSize(width: priorBounds.size.width, height: self.tblView.contentSize.height))
        self.tblView.bounds = CGRect(x: 0, y: 0, width: fittedSize.width, height: fittedSize.height)
        self.tblView.reloadData()
        let pdfPageBounds: CGRect = CGRect(x: 0, y: 0, width: fittedSize.width, height: (fittedSize.height))
        let pdfData: NSMutableData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, pdfPageBounds, nil)
        UIGraphicsBeginPDFPageWithInfo(pdfPageBounds, nil)
        self.tblView.layer.render(in: UIGraphicsGetCurrentContext()!)
        UIGraphicsEndPDFContext()
        let documentDirectories = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        let documentsFileName = documentDirectories! + "/" + "pdfName"
        pdfData.write(toFile: documentsFileName, atomically: true)
        print(documentsFileName)
    }*/
    
    

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
