//
//  parkingReportTVCell.swift
//  Online Parking Project
//
//  Created by AJAY BAJWA on 2018-11-16.
//  Copyright © 2018 lambton. All rights reserved.
//

import UIKit

class parkingReportTVCell: UITableViewCell {

    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblCarPlateNumber: UILabel!
    @IBOutlet weak var lblCarCompany: UILabel!
    @IBOutlet weak var lblEntryTime: UILabel!
    @IBOutlet weak var lblExitTime: UILabel!
    @IBOutlet weak var lblHoursParked: UILabel!
    @IBOutlet weak var lblDateTime: UILabel!
    @IBOutlet weak var lblLotNumber: UILabel!
    @IBOutlet weak var lblSpotNumber: UILabel!
    @IBOutlet weak var lblCarColor: UILabel!
    @IBOutlet weak var lblPaymentMethod: UILabel!
    @IBOutlet weak var lblPaymentAmount: UILabel!
    @IBOutlet weak var lblLatitude: UILabel!
    @IBOutlet weak var lblLongitude: UILabel!
    @IBOutlet weak var imgCarCompany: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
