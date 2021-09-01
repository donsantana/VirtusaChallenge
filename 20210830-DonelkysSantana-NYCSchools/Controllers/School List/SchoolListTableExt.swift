//
//  SchoolListTableExt.swift
//  20210930-DonelkysSantana-NYCSchools
//
//  Created by Donelkys Santana on 8/30/21.
//

import UIKit

extension SchoolListController: UITableViewDelegate, UITableViewDataSource{
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    print(schoolList.count)
    return schoolList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = Bundle.main.loadNibNamed("SchoolViewCell", owner: self, options: nil)?.first as! SchoolCell
    cell.initContent(school: schoolList[indexPath.row])
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: false)
    let vc = self.storyboard?.instantiateViewController(identifier: "detailsView") as! SchoolDetailsController
    vc.schoolSelected = schoolList[indexPath.row]
    self.navigationController?.pushViewController(vc, animated: true)
//    contentPanel = storyboard?.instantiateViewController(withIdentifier: "SchoolViewCell") as? SchoolCell
//    if indexPath.row == 0 {
//      if globalVariables.cliente.yapa >= globalVariables.appConfig.uso_yapa{
//      contentPanel?.actionType = 2
//        yapaPanel.set(contentViewController: contentPanel)
//        yapaPanel.addPanel(toParent: self)
//        tableView.deselectRow(at: indexPath, animated: false)
//      }else{
//        let alertaDos = UIAlertController (title: "Yapa Error", message: "Solo puede utilizar su YAPA cuando acumule un valor igual o superior a $0.5", preferredStyle: UIAlertController.Style.alert)
//        alertaDos.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: {alerAction in
//
//        }))
//        self.present(alertaDos, animated: true, completion: nil)
//      }
////      yapaPanel.set(contentViewController: contentPanel)
////      yapaPanel.addPanel(toParent: self)
//    }else{
//      contentPanel?.actionType = 1
//      yapaPanel.set(contentViewController: contentPanel)
//      yapaPanel.addPanel(toParent: self)
//      tableView.deselectRow(at: indexPath, animated: false)
//    }
    
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
}
