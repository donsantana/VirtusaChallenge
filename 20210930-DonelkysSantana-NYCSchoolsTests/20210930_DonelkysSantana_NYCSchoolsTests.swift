//
//  _0210930_DonelkysSantana_NYCSchoolsTests.swift
//  20210930-DonelkysSantana-NYCSchoolsTests
//
//  Created by Donelkys Santana on 8/30/21.
//

import XCTest
@testable import _0210830_DonelkysSantana_NYCSchools

class _0210930_DonelkysSantana_NYCSchoolsTests: XCTestCase {
  var school: School!
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    school = School(fromJson: ["dbn": "1234","school_name":"Test name","primary_address_line_1":"address 1","city":"New York","zip":"77077","state_code":"NY","latitude":"0.0","longitude":"0.0","neighborhood":"NY Neighborhood","overview_paragraph":"Overview Example"])
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testExample() throws {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
  }
  
  func testPerformanceExample() throws {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
  func testAttributes(){
    XCTAssertEqual(school.id, "1234")
    XCTAssertEqual(school.name, "Test name")
    XCTAssertEqual(school.address, "address 1")
    XCTAssertEqual(school.city, "New York")
    XCTAssertEqual(school.zip, "77077")
    XCTAssertEqual(school.state, "NY")
    XCTAssertEqual(school.latitude, "0.0")
    XCTAssertEqual(school.longitude,"0.0")
    XCTAssertEqual(school.neighborhood,"NY Neighborhood")
    XCTAssertEqual(school.overview,"Overview Example")
    
  }
}
