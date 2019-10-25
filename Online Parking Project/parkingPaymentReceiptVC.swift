//
//  parkingPaymentReceiptVC.swift
//  Online Parking Project
//
//  Created by AJAY BAJWA on 2018-11-14.
//  Copyright © 2018 lambton. All rights reserved.
//

import UIKit

class parkingPaymentReceiptVC: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if carCompanyPicker == pickerView{
            return self.carCompanyList.count
        }
        if carColorPicker == pickerView{
            return self.carColorList.count
        }
        if lotNumberPicker == pickerView{
            return self.lotNumberList.count
        }
        if spotNumberPicker1 == pickerView{
            return self.spotNumberLot1.count
        }
        if spotNumberPicker2 == pickerView{
            return self.spotNumberLot2.count
        }
        if spotNumberPicker3 == pickerView{
            return self.spotNumberLot2.count
        }
        return 0
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if carCompanyPicker == pickerView{
            return self.carCompanyList[row]
        }
        if carColorPicker == pickerView{
            return self.carColorList[row]
        }
        if lotNumberPicker == pickerView{
            return self.lotNumberList[row]
        }
        if spotNumberPicker1 == pickerView{
            return self.spotNumberLot1[row]
        }
        if spotNumberPicker2 == pickerView{
            return self.spotNumberLot2[row]
        }
        if spotNumberPicker3 == pickerView{
            return self.spotNumberLot3[row]
        }
        return ""
        
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        if carCompanyPicker == pickerView{
            txtCarCompany.text = carCompanyList[row]
            if txtCarCompany.text == "Toyota"{
                imgCarCompany.image = UIImage(named: "toyota.png")
            }
            if txtCarCompany.text == "BMW"{
                imgCarCompany.image = UIImage(named: "bmw.png")
            }
            if txtCarCompany.text == "Jaguar"{
                imgCarCompany.image = UIImage(named: "jaguar.png")
            }
            if txtCarCompany.text == "Volkswagen"{
                imgCarCompany.image = UIImage(named: "volkswagen.png")
            }
            if txtCarCompany.text == "Mercedes"{
                imgCarCompany.image = UIImage(named: "mercedes.png")
            }
            if txtCarCompany.text == "Honda"{
                imgCarCompany.image = UIImage(named: "honda.png")
            }
            if txtCarCompany.text == "Jeep"{
                imgCarCompany.image = UIImage(named: "jeep.png")
            }
            if txtCarCompany.text == "Suzuki"{
                imgCarCompany.image = UIImage(named: "suzuki.png")
            }
            //txtCarCompany.resignFirstResponder()
        }
        if carColorPicker == pickerView{
            let selectedIndex = carColorPicker.selectedRow(inComponent: 0)
            txtCarColor.text = carColorList[selectedIndex]
            txtCarColor.text = carColorList[row]
            //txtCarColor.resignFirstResponder()
        }
        if lotNumberPicker == pickerView{
            txtLotNumber.text = lotNumberList[row]
            if txtLotNumber.text == "L1"{
                txtSpotNumber.inputView = spotNumberPicker1
            }
            if txtLotNumber.text == "L2"{
                txtSpotNumber.inputView = spotNumberPicker2
            }
            if txtLotNumber.text == "L3"{
                txtSpotNumber.inputView = spotNumberPicker3
            }
            //txtLotNumber.resignFirstResponder()
        }
        
        if spotNumberPicker1 == pickerView{
            
            txtSpotNumber.text = spotNumberLot1[row]
            //txtSpotNumber.resignFirstResponder()
            
        }
        
        if spotNumberPicker2 == pickerView{
            txtSpotNumber.text = spotNumberLot2[row]
            //txtSpotNumber.resignFirstResponder()
        }
        if spotNumberPicker3 == pickerView{
            txtSpotNumber.text = spotNumberLot3[row]
            //txtSpotNumber.resignFirstResponder()
        }
        
    }

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtCarPlateNumber: UITextField!
    @IBOutlet weak var txtCarCompany: UITextField!
    @IBOutlet weak var txtCarColor: UITextField!
    @IBOutlet weak var txtDateAndTime: UITextField!
    @IBOutlet weak var txtLotNumber: UITextField!
    @IBOutlet weak var txtSpotNumber: UITextField!
    @IBOutlet weak var txtPaymentMethod: UITextField!
    @IBOutlet weak var sgmPaymentMethod: UISegmentedControl!
    @IBOutlet weak var lblTotalAmount: UILabel!
    @IBOutlet weak var imgCarCompany: UIImageView!
    @IBOutlet weak var sgmHoursParked: UISegmentedControl!
    
    var carCompanyPicker = UIPickerView()
    var carColorPicker = UIPickerView()
    var lotNumberPicker = UIPickerView()
    var spotNumberPicker1 = UIPickerView()
    var spotNumberPicker2 = UIPickerView()
    var spotNumberPicker3 = UIPickerView()
    var paymentMethod : [String] = ["Debit Card","Credit Card"]
    var carCompanyList : [String] = ["Volkswagen","Honda","Jeep","Suzuki","Toyota","BMW","Jaguar","Mercedes"]
    var carColorList:[String] = ["White","Yellow","Black","Silver","Red","White","Blue","Green","Gold","Orange"]
    var lotNumberList : [String] = ["L1","L2","L3"]
    var spotNumberLot1 : [String] = ["L1S1","L1S2","L1S3"]
    var spotNumberLot2 : [String] = ["L2S1","L2S2","L2S3"]
    var spotNumberLot3 : [String] = ["L3S1","L3S2","L3S3"]
    var paymentAmount:Double = 0.0
    var hoursParked:Double=0.0
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController!.setNavigationBarHidden(false, animated: true)
        self.title = "Parking Payment Receipt"
        
        //let PayButton = UIBarButtonItem(title: "Pay", style: .plain, target: self, action:   #selector(ParkingReport))
        
        //self.navigationItem.rightBarButtonItem = PayButton
        let CancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action:   #selector(MenuPage))
        
        self.navigationItem.leftBarButtonItem = CancelButton

    }
    func displayPayButton(){
        self.navigationController!.setNavigationBarHidden(false, animated: true)
        self.title = "Parking Payment Receipt"
        
        let PayButton = UIBarButtonItem(title: "Pay", style: .plain, target: self, action:   #selector(ParkingReport))
        
        self.navigationItem.rightBarButtonItem = PayButton
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        carCompanyPicker.delegate = self
        carCompanyPicker.dataSource = self
        txtCarCompany.inputView = carCompanyPicker
        self.carCompanyPicker.selectRow(3, inComponent: 0, animated: false)
        carColorPicker.delegate=self
        carColorPicker.dataSource=self
        txtCarColor.inputView=carColorPicker
        self.carColorPicker.selectRow(3, inComponent: 0, animated: false)
        lotNumberPicker.delegate = self
        lotNumberPicker.dataSource = self
        txtLotNumber.inputView = lotNumberPicker
        self.lotNumberPicker.selectRow(1, inComponent: 0, animated: false)
        spotNumberPicker1.delegate = self
        spotNumberPicker1.dataSource = self
        self.spotNumberPicker1.selectRow(1, inComponent: 0, animated: false)
        spotNumberPicker2.delegate = self
        spotNumberPicker2.dataSource = self
        self.spotNumberPicker2.selectRow(1, inComponent: 0, animated: false)
        spotNumberPicker3.delegate = self
        spotNumberPicker3.dataSource = self
        self.spotNumberPicker3.selectRow(1, inComponent: 0, animated: false)
        currentTimeDate()

        //creating toolbar for picker views
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // done button for toolbar
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel,target: nil,action:#selector(cancelClick))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(barButtonSystemItem: .done,target: nil,action:#selector(doneClick))
        
        toolbar.setItems([cancel,space,done], animated: false)
        txtCarCompany.inputAccessoryView = toolbar
        txtCarColor.inputAccessoryView = toolbar
        txtLotNumber.inputAccessoryView = toolbar
        txtSpotNumber.inputAccessoryView = toolbar

        // Do any additional setup after loading the view.
    }
    @IBAction func sgmHoursParked(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex==0{
            hoursParked=1/2
            paymentAmount=5
            self.lblTotalAmount.text="$ \(paymentAmount)"
        }
        else if sender.selectedSegmentIndex==1{
            hoursParked=1
            paymentAmount=7
            self.lblTotalAmount.text="$ \(paymentAmount)"
        }
        else if sender.selectedSegmentIndex==2{
            hoursParked=2
            paymentAmount=8.5
            self.lblTotalAmount.text="$ \(paymentAmount)"
        }
        else if sender.selectedSegmentIndex==3{
            hoursParked=3
            paymentAmount=9
            self.lblTotalAmount.text="$ \(paymentAmount)"
        }
        else if sender.selectedSegmentIndex==4{
            hoursParked=24
            paymentAmount=10
            self.lblTotalAmount.text="$ \(paymentAmount)"
        }
    }
    /*@IBAction func stpActionEntryTime(_ sender: UIStepper) {
        let EntryTime = Double(stpEntryTime.value)
        self.txtEntryTime.text = "\(Int(EntryTime)):00"
    }
    @IBAction func stpActionExitTime(_ sender: UIStepper) {
        let ExitTime = Double(stpExitTime.value)
        self.txtExitTime.text = "\(Int(ExitTime)):00"
    }
    @IBAction func btnCalculateHours(_ sender: UIButton) {
        calcTotalHours()
    }
    func calcTotalHours()->Double{
        let entryTime = (Double((stpEntryTime.value ).rounded()))
        let exitTime = (Double((stpExitTime.value ).rounded()))
        
        let TotalHours = exitTime-entryTime
        self.lblTotalHours.text = "\(TotalHours) Hrs"
        return TotalHours
    }*/
    func currentTimeDate(){
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM,dd,yyyy HH:mm a"
        let str = formatter.string(from: Date())
        txtDateAndTime.text = str
    }
    @IBAction func btnCurrentTime(_ sender: UIButton) {
        currentTimeDate()
    }
    @IBAction func sgmActionPaymentMethod(_ sender: UISegmentedControl) {
        txtPaymentMethod.text=paymentMethod[sgmPaymentMethod.selectedSegmentIndex]
    }
    
    /*@IBAction func btnTotalAmount(_ sender: UIButton) {
    
        self.lblTotalAmount.text="$\(paymentAmount)"
        //let noOfHours=calcTotalHours()
        //let ratePerHour = 10.0
        //let taxes = 2.0
        //self.lblTotalAmount.text = "$\((noOfHours * ratePerHour) + taxes))"
    }*/
    @IBAction func btnClickAdd(_ sender: UIButton) {
        if emailValidate(){
            if (txtEmail.text!.isEmpty||txtCarPlateNumber.text!.isEmpty||txtCarCompany.text!.isEmpty||txtCarColor.text!.isEmpty||txtDateAndTime.text!.isEmpty||txtLotNumber.text!.isEmpty||txtSpotNumber.text!.isEmpty||txtPaymentMethod.text!.isEmpty){
                emptyFieldAlert()
            }
            else{
                addToPlist()
                displayPayButton()
            }
        }
        else{
            invalidEmailAlert()
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
    func invalidEmailAlert(){
        let invalidEmailAlert=UIAlertController(title: "Invalid Email", message: "Please Enter the Valid Email Address", preferredStyle: .alert)
        invalidEmailAlert.addAction(UIAlertAction(title: "Retry", style: .cancel, handler: nil))
        self.present(invalidEmailAlert, animated: true, completion: nil)
    }
    func emptyFieldAlert(){
        let EmptyFieldAlert = UIAlertController(title: "Alert", message: "Please Enter Data in all the Fields", preferredStyle: .alert)
        let okalert = UIAlertAction(title: "Ok", style: .default, handler: nil)
        EmptyFieldAlert.addAction(okalert)
        self.present(EmptyFieldAlert, animated: true, completion: nil)
    }
    @objc private func ParkingReport(){
        let saveAlert = UIAlertController(title: "Saved", message: " Thank You! You have successfully CheckedOut.Please check your Parking Report from Menu screen", preferredStyle: .alert)
        
        saveAlert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Data saved"), style: .default, handler:{ _ in self.MenuPage()}))
        self.present(saveAlert, animated: true, completion: nil)
        
        
    }
    @objc func doneClick() {
        if txtCarColor.isEditing==true{
            let selectedIndex = carColorPicker.selectedRow(inComponent: 0)
            txtCarColor.text = carColorList[selectedIndex]
            pickerView(carColorPicker, didSelectRow: selectedIndex, inComponent: 0)
            
        }
        else if txtCarCompany.isEditing==true{
            let selectedIndex = carCompanyPicker.selectedRow(inComponent: 0)
            txtCarCompany.text = carCompanyList[selectedIndex]
            pickerView(carCompanyPicker, didSelectRow: selectedIndex, inComponent: 0)
        }
        else if txtLotNumber.isEditing==true{
           let selectedIndex = lotNumberPicker.selectedRow(inComponent: 0)
            txtLotNumber.text = lotNumberList[selectedIndex]
            pickerView(lotNumberPicker, didSelectRow: selectedIndex, inComponent: 0)
        }
        self.view.endEditing(true)
    }
    @objc func cancelClick() {
        if txtCarCompany.isEditing==true{
            txtCarCompany.text=""
            imgCarCompany.image=nil
        }
        if txtCarColor.isEditing==true{
            txtCarColor.text=""
        }
        if txtLotNumber.isEditing==true{
            txtLotNumber.text=""
        }
        if txtSpotNumber.isEditing==true{
            txtSpotNumber.text=""
        }
        self.view.endEditing(true)
    }
    @objc private func MenuPage(){
        
        let ReportSB: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let ReportVC = ReportSB.instantiateViewController(withIdentifier: "MenuScreen")
        navigationController?.pushViewController(ReportVC, animated: true)
        
    }
    func addToPlist(){
     let ParkingReport = NSMutableDictionary()
     ParkingReport["Email"] = self.txtEmail.text
     ParkingReport["CarPlateNumber"] = self.txtCarPlateNumber.text
     ParkingReport["CarCompany"] = self.txtCarCompany.text
     //ParkingReport["EntryTime"] = self.txtEntryTime.text
     //ParkingReport["ExitTime"] = self.txtExitTime.text
     ParkingReport["DateAndTime"] = self.txtDateAndTime.text
     ParkingReport["HoursParked"] = sgmHoursParked.titleForSegment(at: sgmHoursParked.selectedSegmentIndex)
     ParkingReport["PaymentMethod"] = self.txtPaymentMethod.text
     ParkingReport["LotNumber"] = self.txtLotNumber.text
     ParkingReport["SpotNumber"] = self.txtSpotNumber.text
     ParkingReport["PaymentAmount"] = self.lblTotalAmount.text
     ParkingReport["CarColor"] = self.txtCarColor.text
     
     if let Path = Bundle.main.path(forResource: "ParkingReport", ofType: "plist"){
     let ParkingReportplist = NSMutableArray(contentsOfFile: Path)
     ParkingReportplist?.add(ParkingReport)
     if (ParkingReportplist?.write(toFile: Path, atomically: true))!{
     print("ParkingReportlist : \(String(describing: ParkingReportplist))")
     }
     
     else{
     print("Something went Wrong")
     }
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
