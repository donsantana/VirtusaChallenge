//
//  SchoolDetailsController.swift
//  20210930-DonelkysSantana-NYCSchools
//
//  Created by Donelkys Santana on 8/31/21.
//

import UIKit
import MapKit

class SchoolDetailsController: UIViewController{
  var apiService = ApiService()
  let responsive = Responsive()
  var schoolSelected: School!
  var satScoreList: [SATScore] = []
  
  @IBOutlet weak var mapView: MKMapView!
  @IBOutlet weak var schoolNameText: UILabel!
  @IBOutlet weak var neighborhoodText: UILabel!
  @IBOutlet weak var addressText: UILabel!
  @IBOutlet weak var overviewText: UITextView!
  
  @IBOutlet weak var waitingView: UIVisualEffectView!
  @IBOutlet weak var mathScoreText: UILabel!
  @IBOutlet weak var readingScoreText: UILabel!
  @IBOutlet weak var writingScoreText: UILabel!
  
  @IBOutlet weak var mapViewHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var overviewHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var satScoreViewHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var basicDetailsHeightContraints: NSLayoutConstraint!
  @IBOutlet weak var readingWidthConstraint: NSLayoutConstraint!
  
  override func viewDidLoad() {
    apiService.delegate = self
    waitingView.isHidden = false
    apiService.getSatScoresAPI()
    mapViewHeightConstraint.constant = responsive.heightFloatPercent(percent: 33)
    overviewHeightConstraint.constant = responsive.heightFloatPercent(percent: 25)
    satScoreViewHeightConstraint.constant = responsive.heightFloatPercent(percent: 12)
    basicDetailsHeightContraints.constant = responsive.heightFloatPercent(percent: 10)
    readingWidthConstraint.constant = responsive.widthFloatPercent(percent: 30)
    
    schoolNameText.text = schoolSelected.name
    neighborhoodText.text = schoolSelected.neighborhood
    addressText.text = "\(schoolSelected.address),\r\(schoolSelected.city),\(schoolSelected.state)"
    overviewText.text = schoolSelected.overview
    mapInit()
  }
  
  func mapInit(){
    let mapCenter = CLLocation(latitude: Double(schoolSelected.latitude)!, longitude: Double(schoolSelected.longitude)!)
    let region = MKCoordinateRegion(
      center: mapCenter.coordinate,
      latitudinalMeters: 100,
      longitudinalMeters: 100)
    mapView.setCameraBoundary(
      MKMapView.CameraBoundary(coordinateRegion: region),
      animated: true)
    
    let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 20000)
    mapView.setCameraZoomRange(zoomRange, animated: true)
    
    let schoolAnnotation = MKPointAnnotation()
    schoolAnnotation.title = schoolSelected.name
    schoolAnnotation.coordinate = CLLocationCoordinate2D(latitude: Double(schoolSelected.latitude)!, longitude: Double(schoolSelected.longitude)!)
    mapView.addAnnotation(schoolAnnotation)
  }
}

extension SchoolDetailsController: ApiServiceDelegate{
  func apiRequest(_ controller: ApiService, getSATScores response: [SATScore]) {
    
    satScoreList = response
    print("HEREEEEE \(schoolSelected.id)")
    let schoolScores = satScoreList.filter({$0.id == self.schoolSelected.id}).first
    DispatchQueue.main.async {
      self.waitingView.isHidden = true
      self.mathScoreText.text = schoolScores != nil ? "\(schoolScores!.mathScore)" : "NA"
      self.readingScoreText.text = schoolScores != nil ? "\(schoolScores!.readingScore)" : "NA"
      self.writingScoreText.text = schoolScores != nil ? "\(schoolScores!.writingScore)" : "NA"
    }
    
  }
}
