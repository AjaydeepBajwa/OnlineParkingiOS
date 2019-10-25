//
//  userProfileVC.swift
//  Online Parking Project
//
//  Created by AJAY BAJWA on 2018-11-08.
//  Copyright © 2018 lambton. All rights reserved.
//

import UIKit

class userProfileVC: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var lblContactNumber: UILabel!
    @IBOutlet weak var lblDateOfBirth: UILabel!
    @IBOutlet weak var lblStreetAddress: UILabel!
    @IBOutlet weak var lblPostalCode: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblCarPlateNumber: UILabel!
    @IBOutlet weak var lblLastLogin: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController!.setNavigationBarHidden(false, animated: true)
        self.title = "User Profile"
        self.navigationController!.setNavigationBarHidden(false, animated: true)
        // Do any additional setup after loading the view.
        self.lblEmail.text = UserDefaults.standard.string(forKey: "userEmail")
        self.lblPassword.text = UserDefaults.standard.string(forKey: "userPassword")
        self.lblName.text = UserDefaults.standard.string(forKey: "userName")
        self.lblContactNumber.text = UserDefaults.standard.string(forKey: "userContact")
        self.lblDateOfBirth.text = UserDefaults.standard.string(forKey: "userDateOfBirth")
        self.lblStreetAddress.text = UserDefaults.standard.string(forKey: "userStreetAddress")
        self.lblPostalCode.text = UserDefaults.standard.string(forKey: "userPostalCode")
        self.lblCity.text = UserDefaults.standard.string(forKey: "userCity")
        self.lblCarPlateNumber.text = UserDefaults.standard.string(forKey: "userCarPlateNumber")
        self.lblLastLogin.text=UserDefaults.standard.string(forKey: "lastLogin")
    }
    
    @IBAction func btnClickEditProfile(_ sender: UIButton) {
        displayEditProfileScreen()
    }
    
    func displayEditProfileScreen(){
        let EditUserProfileSB: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let EditUserProfileVC = EditUserProfileSB.instantiateViewController(withIdentifier: "EditUserProfileScreen")
        navigationController?.pushViewController(EditUserProfileVC, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
