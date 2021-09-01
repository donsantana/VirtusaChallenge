//
//  UIView.swift
//  20210930-DonelkysSantana-NYCSchools
//
//  Created by Donelkys Santana on 8/31/21.
//

import UIKit

extension UIView{
  func addShadow(){
    self.layer.shadowColor = UIColor.black.cgColor
    self.layer.shadowOpacity = 0.2
    self.layer.shadowOffset = CGSize.zero
    self.layer.shadowRadius = 10
  }
}
