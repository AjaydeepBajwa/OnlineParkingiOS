//
//  GuideVC.swift
//  Online Parking Project
//
//  Created by AJAY BAJWA on 2018-11-13.
//  Copyright © 2018 lambton. All rights reserved.
//

import UIKit
import  WebKit

class GuideVC: UIViewController {

    @IBOutlet weak var GuideWebViewKit: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.setNavigationBarHidden(false, animated: true)
        self.title = "App Guide"
         loadGuidePage()

        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func loadGuidePage(){
        let filePath = Bundle.main.url(forResource: "Guide", withExtension: "html")
        let myRequest = URLRequest(url: filePath!)
        GuideWebViewKit.load(myRequest)
        
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
