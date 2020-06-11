//
//  SummaryResponse.swift
//
//  Created by Chris Ferdian on 10/06/20
//  Copyright (c) Chrizers. All rights reserved.
//

import Foundation
import SwiftyJSON

// MARK: - SummaryResponse
struct SummaryResponse: Codable {
    let global: Global?
    let countries: [Country]?
    let date: String?

    enum CodingKeys: String, CodingKey {
        case global = "Global"
        case countries = "Countries"
        case date = "Date"
    }
}
