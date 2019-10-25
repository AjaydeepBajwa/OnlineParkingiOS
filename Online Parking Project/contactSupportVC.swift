//
//  contactSupportVC.swift
//  Online Parking Project
//
//  Created by AJAY BAJWA on 2018-11-18.
//  Copyright © 2018 lambton. All rights reserved.
//

import UIKit
import MessageUI

class contactSupportVC: UIViewController,MFMessageComposeViewControllerDelegate {

    @IBOutlet weak var btnCall: UIButton!
    @IBAction func btnClickCall(_ sender: UIButton) {
        guard let numberString=sender.titleLabel?.text,let url=URL(string: "tel://\(numberString)")
            else{
                return
        }
        //UIApplication.shared.open(url)
        if UIApplication.shared.canOpenURL(url){
            if #available(iOS 10, *)
            {
                UIApplication.shared.open(url)
            }
            else
            {
                UIApplication.shared.openURL(url)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.setNavigationBarHidden(false, animated: true)
        self.title = "Parking Support"

        // Do any additional setup after loading the view.
    }
    @IBAction func btnClickSMS(_ sender: UIButton) {
        if MFMessageComposeViewController.canSendText() {
            
            
            let messageVC = MFMessageComposeViewController()
            
            messageVC.body = "Hey!"
            messageVC.recipients = ["+16479147955"]
            messageVC.messageComposeDelegate = self
            
            self.present(messageVC, animated: false, completion: nil)
        }
        else{
            print("Not available on Simulator")
        }
    }
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult)
    {
        switch (result) {
        case .cancelled:
            print("Message Cancelled")
            self.dismiss(animated: true, completion: nil)
        case .failed:
            print("Message not sent")
            self.dismiss(animated: true, completion: nil)
        case .sent:
            print("Message sent")
            self.dismiss(animated: true, completion: nil)
        }
    }
    //UIApplication.shared.open(URL(string: "sms:")!, options: [:], completionHandler: nil)
    
    @IBAction func btnClickEmail(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "mailto:letv4545@gmail.com")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func btnClickVisitSite(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.google.com/maps/dir/43.6450282,-79.73632/parking/@43.6544154,-79.7580618,14z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x882b3fd7b426bb0d:0xcd4ee46185f7b39e!2m2!1d-79.7383482!2d43.6650437")! as URL, options: [:], completionHandler: nil)
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
