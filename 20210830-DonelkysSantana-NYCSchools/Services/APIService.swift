//
//  APIService.swift
//  20210930-DonelkysSantana-NYCSchools
//
//  Created by Donelkys Santana on 8/30/21.
//

import Foundation
import UIKit

protocol ApiServiceDelegate: AnyObject {
  func apiRequest(_ controller: ApiService, getNYCSchools response: [School])
  func apiRequest(_ controller: ApiService, getSATScores response: [SATScore])
  func apiRequest(_ controller: ApiService, getAPIError msg: String)
}

final class ApiService {
  
  weak var delegate: ApiServiceDelegate?
 
  func getNYCShoolsAPI(){
    print(ApiUrls.listNYCSchoolsAPI)
    let request = URLRequest(url: URL(string: ApiUrls.listNYCSchoolsAPI)!)
    let session = URLSession.shared
    let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
      if let error = error {
        print("error \(error.localizedDescription)")
        self.handlerError(error: error.localizedDescription)
        return
      }

      guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
        self.handlerError(error: "Bad Response Status Code")
        return
      }

//      if let data = data {
//        //pull out the declaration of the decoder object
//        let decoder = JSONDecoder()
//        //set how we want to interpret dates in the JSON
//        decoder.dateDecodingStrategy = .iso8601
//        //decode directly to an array of User structs rather than a Response
//        if let decodedResponse = try? decoder.decode([School].self, from: data) {
//          print(decodedResponse)
//          self.delegate?.apiRequest(self, getNYCSchools: decodedResponse)
//          return
//        }else{
//          print("error JSON")
//        }
//      }else{
//        print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
//      }

      do {
        let json = try JSONSerialization.jsonObject(with: data!) as! [[String: Any]]
        //print("json \(json)")
        var schoolList: [School] = []
        for schoolJson in json{
          let school = School(fromJson: schoolJson)
          schoolList.append(school)
        }
        self.delegate?.apiRequest(self, getNYCSchools: schoolList)
      } catch {
        print("JSON error: \(error.localizedDescription)")
        self.handlerError(error: "JSON Format error")
      }

    })
    task.resume()
  }
  
  func getSatScoresAPI(){
    print(ApiUrls.getSATScoresAPI)
    let request = URLRequest(url: URL(string: ApiUrls.getSATScoresAPI)!)
    let session = URLSession.shared
    let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
      if let error = error {
        print("error \(error.localizedDescription)")
        self.handlerError(error: error.localizedDescription)
        return
      }

      guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
        self.handlerError(error: "Bad Response Status Code")
        return
      }

      if let data = data {
        //pull out the declaration of the decoder object
        let decoder = JSONDecoder()
        //set how we want to interpret dates in the JSON
        decoder.dateDecodingStrategy = .iso8601
        //decode directly to an array of User structs rather than a Response
        if let decodedResponse = try? decoder.decode([SATScore].self, from: data) {
          //print(decodedResponse)
          self.delegate?.apiRequest(self, getSATScores: decodedResponse)
          return
        }else{
          print("error JSON")
        }
      }else{
        print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
      }

//      do {
//        let json = try JSONSerialization.jsonObject(with: data!) as! [[String: Any]]
//        print("json \(json)")
////        var schoolList: [School] = []
////        for schoolJson in json{
////          let school = School(fromJson: schoolJson)
////          schoolList.append(school)
////        }
////        self.delegate?.apiRequest(self, getNYCSchools: schoolList)
//      } catch {
//        print("JSON error: \(error.localizedDescription)")
//        self.handlerError(error: "JSON Format error")
//      }

    })
    task.resume()
  }
  
  func handlerError(error: String){
    self.delegate?.apiRequest(self, getAPIError: error)
  }
}

extension ApiServiceDelegate{
  func apiRequest(_ controller: ApiService, getNYCSchools response: [School]){}
  func apiRequest(_ controller: ApiService, getSATScores response: [SATScore]){}
  func apiRequest(_ controller: ApiService, getAPIError msg: String){}
}
