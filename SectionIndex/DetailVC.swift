//
//  DetailVC.swift
//  SectionIndex
//
//  Created by iOS Student on 1/11/17.
//  Copyright © 2017 tek4fun. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    var person = Person()
    var labelName = UILabel()
    var labelPhoneNum = UILabel()
    var labelMobileBlue = UILabel()

    var imgPhone = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white

        self.labelName.frame = CGRect(x: 30, y: 100, width: 300, height: 50)
        self.labelName.font = UIFont.boldSystemFont(ofSize: 25)
        self.labelName.text = person.lastName + " " + person.firstName

        self.labelPhoneNum.frame = CGRect(x: 30, y: 150, width: 200, height: 50)
        self.labelPhoneNum.font = UIFont.systemFont(ofSize: 15)
        self.labelPhoneNum.text = person.mobilePhone

        self.imgPhone.image = UIImage(named: "phone")
        self.imgPhone.frame = CGRect(x: 230, y: 150, width: 79, height: 50)

        self.labelMobileBlue.frame = CGRect(x: 30, y: 135, width: 100, height: 30)
        self.labelMobileBlue.text = "Mobile"
        self.labelMobileBlue.textColor = UIColor.blue


        self.view.addSubview(labelMobileBlue)
        self.view.addSubview(imgPhone)
        self.view.addSubview(labelName)
        self.view.addSubview(labelPhoneNum)
    }


}
