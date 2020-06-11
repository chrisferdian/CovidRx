//
//  Countries.swift
//
//  Created by Chris Ferdian on 10/06/20
//  Copyright (c) Chrizers. All rights reserved.
//

import Foundation
import SwiftyJSON

// MARK: - Country
struct Country: Codable {
    let country, countryCode, slug: String?
    let newConfirmed, totalConfirmed, newDeaths, totalDeaths: Int?
    let newRecovered, totalRecovered: Int?
    let date: String?

    enum CodingKeys: String, CodingKey {
        case country = "Country"
        case countryCode = "CountryCode"
        case slug = "Slug"
        case newConfirmed = "NewConfirmed"
        case totalConfirmed = "TotalConfirmed"
        case newDeaths = "NewDeaths"
        case totalDeaths = "TotalDeaths"
        case newRecovered = "NewRecovered"
        case totalRecovered = "TotalRecovered"
        case date = "Date"
    }
}
