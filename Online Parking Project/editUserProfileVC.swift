//
//  editUserProfileVC.swift
//  Online Parking Project
//
//  Created by AJAY BAJWA on 2018-11-17.
//  Copyright © 2018 lambton. All rights reserved.
//

import UIKit

class editUserProfileVC: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    

    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtContactNumber: UITextField!
    @IBOutlet weak var txtDob: UITextField!
    @IBOutlet weak var txtStreetAddress: UITextField!
    @IBOutlet weak var txtPostalCode: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtCarPlateNumber: UITextField!
    
    let dobPicker = UIDatePicker()
    var cityPickerView = UIPickerView()
    
    //Creating Array of City Names
    var cityList: [String] = ["Brampton","Burlington","Ottawa", "Calgory", "Markham","Missisauga","Niagara Falls","Sarnia","Windsor","Vancouver", "windsor", "Ajex", "Pickering", "Admenton", "Jasper", "Toronto", "St.Thomas", "Alberta", "London", "Montreal"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.setNavigationBarHidden(false, animated: true)
        self.title = "Edit User Details"
        cityPickerView.delegate = self
        cityPickerView.dataSource = self
        txtCity.inputView = cityPickerView
        
        createDatePicker()
        
        // Do any additional setup after loading the view.
        self.txtEmail.text = UserDefaults.standard.string(forKey: "userEmail")
        self.txtPassword.text = UserDefaults.standard.string(forKey: "userPassword")
        self.txtUserName.text = UserDefaults.standard.string(forKey: "userName")
        self.txtContactNumber.text = UserDefaults.standard.string(forKey: "userContact")
        self.txtDob.text = UserDefaults.standard.string(forKey: "userDateOfBirth")
        self.txtStreetAddress.text = UserDefaults.standard.string(forKey: "userStreetAddress")
        self.txtPostalCode.text = UserDefaults.standard.string(forKey: "userPostalCode")
        self.txtCity.text = UserDefaults.standard.string(forKey: "userCity")
        self.txtCarPlateNumber.text = UserDefaults.standard.string(forKey: "userCarPlateNumber")

        // Do any additional setup after loading the view.
    }
    func createDatePicker(){
        // toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // done button for toolbar
        let done = UIBarButtonItem(barButtonSystemItem: .done,target: nil,action:#selector(donePressed))
        toolbar.setItems([done], animated: false)
        
        txtDob.inputAccessoryView = toolbar
        txtDob.inputView = dobPicker
        
        // format picker for date
        dobPicker.datePickerMode = .date
        
    }
    @objc func donePressed(){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        let dateString = formatter.string(from: dobPicker.date)
        txtDob.text = "\(dateString)"
        self.view.endEditing(true)
        
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.cityList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.cityList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        txtCity.text = cityList[row]
        //txtCity.resignFirstResponder()
    }
    
    @IBAction func btnClickUpdate(_ sender: UIButton) {
        if emailValidate(){
            displayUserProfile()
        }
        else{
            let invalidEmailAlert=UIAlertController(title: "Invalid Email", message: "Please Enter Valid Email", preferredStyle: .alert)
            invalidEmailAlert.addAction(UIAlertAction(title: "Retry", style: .cancel, handler: nil))
            self.present(invalidEmailAlert, animated: true, completion: nil)
        }
    }
    func emailValidate()->Bool{
        let emailReg = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailReg)
        if emailTest.evaluate(with: txtEmail.text)==true{
            return true
        }
        return false
    }
    
    @objc private func displayUserProfile(){
        
        //checking the Empty fields
        let userName = txtUserName.text!
        let userEmail = txtEmail.text!
        let userPassword = txtPassword.text!
        let userContactNumber = txtContactNumber.text!
        let userDateOfBirth = txtDob.text!
        let userStreetAddress = txtStreetAddress.text!
        let userPostalCode = txtPostalCode.text!
        let userCity = txtCity.text!
        let userCarPlateNumber = txtCarPlateNumber.text!
        if(userName.isEmpty || userEmail.isEmpty || userPassword.isEmpty || userContactNumber.isEmpty || userDateOfBirth.isEmpty || userStreetAddress.isEmpty || userPostalCode.isEmpty || userCity.isEmpty || userCarPlateNumber.isEmpty)
        {
            let EmptyFieldAlert = UIAlertController(title: "Alert", message: "Please Enter Data in all the Fields", preferredStyle: .alert)
            let okalert = UIAlertAction(title: "Ok", style: .default, handler: nil)
            EmptyFieldAlert.addAction(okalert)
            self.present(EmptyFieldAlert, animated: true, completion: nil)
            return
        }
        else
        {
            // Storing the data in UserDefaults
            UserDefaults.standard.set(userEmail, forKey: "userEmail")
            UserDefaults.standard.set(userName, forKey: "userName")
            UserDefaults.standard.set(userPassword, forKey: "userPassword")
            UserDefaults.standard.set(userContactNumber, forKey: "userContact")
            UserDefaults.standard.set(userDateOfBirth, forKey: "userDateOfBirth")
            UserDefaults.standard.set(userStreetAddress, forKey: "userStreetAddress")
            UserDefaults.standard.set(userPostalCode, forKey: "userPostalCode")
            UserDefaults.standard.set(userCity, forKey: "userCity")
            UserDefaults.standard.set(userCarPlateNumber, forKey: "userCarPlateNumber")
            UserDefaults.standard.synchronize()
            // self.selectedCityIndex = self.txtCity.selectedRow(inComponent: 0)
            
            let UserProfileData: String = "\(self.txtUserName.text!) \n \(self.txtContactNumber.text!) \n \(self.txtCity.text!)) \n \(self.txtPostalCode.text!) \n \(self.txtEmail.text!)\n\(self.txtCarPlateNumber.text!))\n\(self.txtDob.text!)\n\(self.txtStreetAddress.text!))"
            
            //let infoAlert = UIAlertController(title: "Verify your details", message: allData, preferredStyle: .alert)
            
            //Action sheet
            let ConfirmProfileAlert = UIAlertController(title: "Confirm your Profile details", message: UserProfileData, preferredStyle: .alert)
            
            ConfirmProfileAlert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
            ConfirmProfileAlert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: {_ in self.profileUpdatedAlert()}))
            
            self.present(ConfirmProfileAlert, animated: true, completion: nil)
        }
    }
    func profileUpdatedAlert(){
        let profileUpdatedAlert = UIAlertController(title: "Profile Updated", message: "Your Profile has been Updated", preferredStyle: .alert)
        profileUpdatedAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in self.displayMenuScreen()}))
        self.present(profileUpdatedAlert, animated: true, completion: nil)
    }
    @objc func displayMenuScreen() {
        let newCustomer = Customer(self.txtUserName.text!, self.txtContactNumber.text!, self.txtCity.text!, self.txtPostalCode.text!, self.txtEmail.text!, self.txtPassword.text!,self.txtCarPlateNumber.text!,self.txtDob.text!,self.txtStreetAddress.text!)
        
        if Customer.addCustomer(cust: newCustomer){
            let EditmenuSB: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let EditmenuVC = EditmenuSB.instantiateViewController(withIdentifier: "MenuScreen")
            navigationController?.pushViewController(EditmenuVC, animated: true)}
        else{
            print("Something goes wrong")
        }
        
        
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
