//
//  SATScore.swift
//  20210930-DonelkysSantana-NYCSchools
//
//  Created by Donelkys Santana on 8/31/21.
//

import Foundation

struct SATScore: Decodable, Identifiable {
  var id, schoolName: String
  var numberOfTest, readingScore, mathScore, writingScore: String
  
  private enum CodingKeys: String, CodingKey {
    case id = "dbn"
    case schoolName = "school_name"
    case numberOfTest = "num_of_sat_test_takers"
    case readingScore = "sat_critical_reading_avg_score"
    case mathScore = "sat_math_avg_score"
    case writingScore = "sat_writing_avg_score"
  }
}
