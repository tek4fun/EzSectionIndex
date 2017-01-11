//
//  TableViewController.swift
//  SectionIndex
//
//  Created by iOS Student on 1/11/17.
//  Copyright © 2017 tek4fun. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var arrayData: NSMutableArray!
    var dictContacts = NSMutableDictionary()
    var arrayKey: NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.sectionIndexBackgroundColor = UIColor.gray
        self.tableView.sectionIndexColor = UIColor.white

        arrayData = NSMutableArray()
        for _ in 0..<60 {
            arrayData.add(Person())
        }

        for element in arrayData
        {
            let person = element as! Person

            var firstLetter: String = (person.firstName as NSString!).substring(to: 1)

            if firstLetter == "Đ" {
                firstLetter = "D"
            }
            if firstLetter == "Á" {
                firstLetter = "A"
            }



            var arrayForLetter: NSMutableArray!

            if (dictContacts.value(forKey: firstLetter) != nil)
            {
                arrayForLetter = dictContacts.value(forKey: firstLetter) as! NSMutableArray
                arrayForLetter.add(person)
                dictContacts.setValue(arrayForLetter, forKey: firstLetter)
            }
            else
            {
                arrayForLetter = NSMutableArray(object: person)

                dictContacts.setValue(arrayForLetter, forKey: firstLetter)
            }
        }
        arrayKey = dictContacts.allKeys as! [String] as NSArray!
        arrayKey = arrayKey.sortedArray(using: #selector(NSNumber.compare(_:))) as NSArray!
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.gray
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return arrayKey.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let sectionTitle = arrayKey[section]
        let sectionPersons = dictContacts[sectionTitle as! String] as! NSArray
        return sectionPersons.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrayKey[section] as? String
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if (cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        }

        let sectionTitle = arrayKey[indexPath.section]
        let sectionPersons = dictContacts[sectionTitle as! String] as! NSArray

        let person = sectionPersons[indexPath.row] as! Person
        cell?.textLabel?.text = person.fullName
        cell?.detailTextLabel?.text = person.mobilePhone
        return cell!
    }

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return arrayKey as? [String]
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailVC()

        let sectionTitle = arrayKey[indexPath.section]
        let sectionPersons = dictContacts[sectionTitle as! String] as! NSArray

        let person = sectionPersons[indexPath.row] as! Person
        detailVC.person = person

        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
