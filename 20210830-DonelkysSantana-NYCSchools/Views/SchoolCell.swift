//
//  SchoolCell.swift
//  20210930-DonelkysSantana-NYCSchools
//
//  Created by Donelkys Santana on 8/30/21.
//

import UIKit

class SchoolCell: UITableViewCell {
  @IBOutlet weak var schoolNameText: UILabel!
  @IBOutlet weak var neighborhoodText: UILabel!
  @IBOutlet weak var addressText: UILabel!
  @IBOutlet weak var dataContentView: UIView!
  
  func initContent(school: School) {
    self.dataContentView.addShadow()
    schoolNameText.text = school.name
    neighborhoodText.text = school.neighborhood
    addressText.text = "\(school.address),\(school.city),\(school.state),\(school.zip)"
  }
}
