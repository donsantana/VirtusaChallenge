//
//  School.swift
//  20210930-DonelkysSantana-NYCSchools
//
//  Created by Donelkys Santana on 8/30/21.
//

import Foundation

struct School {
  
  var id, name, address, city, zip, state, latitude, longitude, neighborhood, overview: String
  
  init(fromJson: [String: Any]){
    self.id = fromJson["dbn"] as! String
    self.name = fromJson["school_name"] as! String
    self.address = fromJson["primary_address_line_1"] as! String
    self.city = fromJson["city"] as! String
    self.zip = fromJson["zip"] as! String
    self.state = fromJson["state_code"] as! String
    self.latitude = fromJson["latitude"] != nil ? fromJson["latitude"] as! String : "0.0"
    self.longitude = fromJson["longitude"] != nil ? fromJson["longitude"] as! String : "0.0"
    self.neighborhood = fromJson["neighborhood"] as! String
    self.overview = fromJson["overview_paragraph"] as! String
  }
}
