//
//  registerVC.swift
//  Online Parking Project
//
//  Created by AJAY BAJWA on 2018-11-04.
//  Copyright © 2018 lambton. All rights reserved.
//

import UIKit

class registerVC: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtContactNumber: UITextField!
    @IBOutlet weak var DateOfBirth: UITextField!
    @IBOutlet weak var txtStreetAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtPostalCode: UITextField!
    @IBOutlet weak var txtCarPlateNumber: UITextField!
    
    let dobPicker = UIDatePicker()
    var cityPickerView = UIPickerView()
    
    //Creating Array of City Names
    var cityList: [String] = ["Brampton","Burlington","Ottawa", "Calgory", "Markham","Missisauga","Niagara Falls","Sarnia","Windsor","Vancouver", "windsor", "Ajex", "Pickering", "Admenton", "Jasper", "Toronto", "St.Thomas", "Alberta", "London", "Montreal"]
    
    //Register Button Click Action
    @IBAction func registerButtonAction(_ sender: UIButton) {
        if emailValidate(){
            displayUserProfile()
        }
        else {
            let invalidEmailAlert=UIAlertController(title: "Invalid Email", message: "Please Enter Valid Email", preferredStyle: .alert)
            invalidEmailAlert.addAction(UIAlertAction(title: "Retry", style: .cancel, handler: nil))
            self.present(invalidEmailAlert, animated: true, completion: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        /*self.navigationController!.setNavigationBarHidden(false, animated: true)
        self.title = "Register"
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action:   #selector(displayValues))
        //let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action:   #selector(UserProfile))
        self.navigationItem.rightBarButtonItem = doneButton
        // self.navigationItem.leftBarButtonItem = editButton*/
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //add data pickr
        cityPickerView.delegate = self
        cityPickerView.dataSource = self
        txtCity.inputView = cityPickerView
        self.cityPickerView.selectRow(8, inComponent: 0, animated: false)
        // Do any additional setup after loading the view.
        createDatePicker()
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // done button for toolbar
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(barButtonSystemItem: .done,target: nil,action:#selector(doneClick))
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel,target: nil,action:#selector(cancelClick))
        
        toolbar.setItems([cancel,space,done], animated: false)
        //toolbar.setItems([cancel], animated: false)
        txtCity.inputAccessoryView = toolbar
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func createDatePicker(){
        // toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // done button for toolbar
        let done = UIBarButtonItem(barButtonSystemItem: .done,target: nil,action:#selector(donePressed))
        toolbar.setItems([done], animated: false)
        
        DateOfBirth.inputAccessoryView = toolbar
        DateOfBirth.inputView = dobPicker
        
        // format picker for date
        dobPicker.datePickerMode = .date
        
    }
    @objc func donePressed(){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        let dateString = formatter.string(from: dobPicker.date)
        DateOfBirth.text = "\(dateString)"
        self.view.endEditing(true)
        
    }
    @objc func doneClick() {
        let selectedIndex = cityPickerView.selectedRow(inComponent: 0)
        txtCity.text = cityList[selectedIndex]
        self.view.endEditing(true)
    }
    @objc func cancelClick() {
        txtCity.text=""
        self.view.endEditing(true)
    }
    
    @IBAction func btnAlreadyHaveAccount(_ sender: UIButton) {
        let EditmenuSB: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let EditmenuVC = EditmenuSB.instantiateViewController(withIdentifier: "LoginScreen")
        navigationController?.pushViewController(EditmenuVC, animated: true)
    }
    func emailValidate()->Bool{
        let emailReg = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailReg)
        if emailTest.evaluate(with: txtEmail.text)==true{
            return true
        }
        return false
    }
    func currentTimeDate(){
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM,dd,yyyy HH:mm a"
        let str = formatter.string(from: Date())
        UserDefaults.standard.set(str, forKey: "lastLogin")
        
    }
    
    @objc private func displayUserProfile(){
        
        //checking the Empty fields
        let userName = txtName.text!
        let userEmail = txtEmail.text!
        let userPassword = txtPassword.text!
        let userContactNumber = txtContactNumber.text!
        let userDateOfBirth = DateOfBirth.text!
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
            
            let UserProfileData: String = "\(self.txtName.text!) \n \(self.txtContactNumber.text!) \n \(self.txtCity.text!)) \n \(self.txtPostalCode.text!) \n \(self.txtEmail.text!)\n\(self.txtCarPlateNumber.text!))\n\(self.DateOfBirth.text!)\n\(self.txtStreetAddress.text!))"
            
            //let infoAlert = UIAlertController(title: "Verify your details", message: allData, preferredStyle: .alert)
            
            //Action sheet
            let ConfirmProfileAlert = UIAlertController(title: "Confirm your Profile details", message: UserProfileData, preferredStyle: .alert)
            
            ConfirmProfileAlert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
            ConfirmProfileAlert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: {_ in self.displayMenuScreen()}))
            
            self.present(ConfirmProfileAlert, animated: true, completion: nil)
        }
    }
    /*func displayMyAlertMessage(userMessage : String){
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert)
        let okalert = UIAlertAction(title: "Ok", style: .default, handler: nil)
        myAlert.addAction(okalert)
        self.present(myAlert, animated: true, completion: nil)
    }*/
    
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
    
    @objc func displayMenuScreen() {
        let newCustomer = Customer(self.txtName.text!, self.txtContactNumber.text!, self.txtCity.text!, self.txtPostalCode.text!, self.txtEmail.text!, self.txtPassword.text!,self.txtCarPlateNumber.text!,self.DateOfBirth.text!,self.txtStreetAddress.text!)
        
        if Customer.addCustomer(cust: newCustomer){
            let menuSB: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let menuVC = menuSB.instantiateViewController(withIdentifier: "MenuScreen")
            navigationController?.pushViewController(menuVC, animated: true)
            currentTimeDate()
        }
        else{
            print("Something went wrong")
        }
        
        
        
    }
    @objc private func UserProfile(){
        let UserProfileSB: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let UserProfileVC = UserProfileSB.instantiateViewController(withIdentifier: "UserProfileScreen")
        navigationController?.pushViewController(UserProfileVC, animated: true)
        
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
