//
//  Global.swift
//
//  Created by Chris Ferdian on 10/06/20
//  Copyright (c) Chrizers. All rights reserved.
//

import Foundation
import SwiftyJSON

// MARK: - Global
struct Global: Codable {
    let newConfirmed, totalConfirmed, newDeaths, totalDeaths: Int?
    let newRecovered, totalRecovered: Int?

    enum CodingKeys: String, CodingKey {
        case newConfirmed = "NewConfirmed"
        case totalConfirmed = "TotalConfirmed"
        case newDeaths = "NewDeaths"
        case totalDeaths = "TotalDeaths"
        case newRecovered = "NewRecovered"
        case totalRecovered = "TotalRecovered"
    }
}
