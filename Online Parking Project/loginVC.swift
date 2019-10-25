//
//  loginVC.swift
//  Online Parking Project
//
//  Created by AJAY BAJWA on 2018-11-04.
//  Copyright © 2018 lambton. All rights reserved.
//

import UIKit

class loginVC: UIViewController {

    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var switchRemember: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getLoginData()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnloginaction(_ sender: UIBarButtonItem) {
        if emailValidate(){
        if userAuthentication(){
            if switchRemember.isOn{
                saveLoginData()
            }
            else{
                removeLoginData()
            }
            currentTimeDate()
            displayMenuScreen()
        }
        else{
            let invalidLoginAlert = UIAlertController(title: "Invalid User Details", message: "Please enter valid Email/Password", preferredStyle: .alert)
            invalidLoginAlert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(invalidLoginAlert, animated: true, completion: nil)
        }
        }
        else{
            let invalidEmailAlert=UIAlertController(title: "Invalid Email", message: "Please Enter Valid Email", preferredStyle: .alert)
            invalidEmailAlert.addAction(UIAlertAction(title: "Retry", style: .cancel, handler: nil))
            self.present(invalidEmailAlert, animated: true, completion: nil)
        }
            
    }
    func currentTimeDate(){
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM,dd,yyyy HH:mm a"
        let str = formatter.string(from: Date())
        UserDefaults.standard.set(str, forKey: "lastLogin")
        
    }
    @IBAction func swtRemember(_ sender: UISwitch) {
        if self.switchRemember.isOn {
            let saveAlert = UIAlertController(title: "Remembering the User Login Data", message: "Your UserId and Password is saved!", preferredStyle: .alert)
            
            saveAlert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Data saved"), style: .default, handler: nil))
            
            
            self.present(saveAlert, animated: true, completion: nil)
        }
    }
    @IBAction func btnRegisterAction(_ sender: UIBarButtonItem) {
        displayRegisterScreen()
    }
    func saveLoginData(){
        UserDefaults.standard.set(txtEmail.text, forKey: "userId")
        UserDefaults.standard.set(txtPassword.text, forKey: "Password")
        
    }
    func getLoginData(){
        if let email = UserDefaults.standard.value(forKey: "userId"){
            self.txtEmail.text = email as? String
        }
        if let password = UserDefaults.standard.value(forKey: "Password"){
            self.txtPassword.text = password as? String
        }
        
    }
    func removeLoginData(){
        UserDefaults.standard.removeObject(forKey: "userId")
        UserDefaults.standard.removeObject(forKey: "Password")
        
    }
    func userAuthentication()->Bool{
        let userEmail = txtEmail.text
        let userPassword = txtPassword.text
        let storedUserEmail = UserDefaults.standard.string(forKey: "userEmail")
        let storedUserPassword = UserDefaults.standard.string(forKey: "userPassword")
        if(storedUserEmail == userEmail && storedUserPassword == userPassword){
            // login is successfull
            UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
            UserDefaults.standard.synchronize()
            self.dismiss(animated: true, completion: nil)
            
            return true
        }
        return false
    }
    func emailValidate()->Bool{
        let emailReg = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailReg)
        if emailTest.evaluate(with: txtEmail.text)==true{
            return true
        }
        return false
    }
    func displayRegisterScreen(){
        //displaying the register screen
        
        //get an instance of storyboard
        let registerSB: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //create an instance of next view controller
        let registerVC = registerSB.instantiateViewController(withIdentifier: "RegisterScreen") as! registerVC
        
        //launch the next view controller to navigation controller
        navigationController?.pushViewController(registerVC, animated: true)
    }
    func displayMenuScreen() {
        let menuSB: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let menuVC = menuSB.instantiateViewController(withIdentifier: "MenuScreen")
        navigationController?.pushViewController(menuVC, animated: true)
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
