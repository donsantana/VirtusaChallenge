//
//  SchoolListController.swift
//  20210930-DonelkysSantana-NYCSchools
//
//  Created by Donelkys Santana on 8/30/21.
//

import UIKit

class SchoolListController: UIViewController {
  var apiService = ApiService()
  var schoolList: [School] = []
  
  @IBOutlet weak var waitingView: UIVisualEffectView!
  @IBOutlet weak var schoolListTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    apiService.delegate = self
    schoolListTableView.delegate = self
    apiService.getNYCShoolsAPI()
    waitingView.isHidden = false
    // Do any additional setup after loading the view.
  }

}

extension SchoolListController: ApiServiceDelegate{
  func apiRequest(_ controller: ApiService, getNYCSchools response: [School]) {
    DispatchQueue.main.async {
      self.waitingView.isHidden = true
      self.schoolList = response
      self.schoolListTableView.reloadData()
    }
    print(response.first?.name)
  }
  
  func apiRequest(_ controller: ApiService, getAPIError msg: String) {
    DispatchQueue.main.async {
      let alertaDos = UIAlertController (title: "Error", message: msg, preferredStyle: UIAlertController.Style.alert)
      alertaDos.addAction(UIAlertAction(title: "Close", style: .default, handler: {alerAction in

      }))
      self.present(alertaDos, animated: true, completion: nil)
    }
  }
}
