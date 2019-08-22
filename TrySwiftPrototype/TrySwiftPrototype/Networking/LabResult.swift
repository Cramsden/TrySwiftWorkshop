//
//  LabResult.swift
//  TrySwiftPrototype
//
//  Created by Carson Ramsden on 8/17/19.
//  Copyright © 2019 Carson Ramsden. All rights reserved.
//

import Foundation

struct LabResultOutput: Codable {
    let labResults: [LabResult]

    enum CodingKeys: String, CodingKey {
        case labResults = "lab_results"
    }
}

struct LabResult: Codable, Identifiable {
    let id: Int
    let status: String
    let title: String
    let collectedAt: Date
    let orderingProviderID: Int
    let isFlagged: Bool
    let followUpNotes: [String]
    let followUpLinks: [String]
    let interpritation: String
    let panels: [Panel]

    enum CodingKeys: String, CodingKey {
        case id
        case status
        case title
        case collectedAt = "collected_at"
        case orderingProviderID = "ordering_provider_id"
        case isFlagged = "is_flagged"
        case followUpNotes = "follow_up_notes"
        case followUpLinks = "follow_up_links"
        case interpritation
        case panels
      }
}

struct Panel: Codable {
    let name: String
    let measurements: [Measurement]
}

struct Measurement: Codable {
    let name: String
    let referenceRange: ReferenceRange
    let value: Int

    enum CodingKeys: String, CodingKey {
        case name
        case referenceRange = "reference_range"
        case value
    }
}

struct ReferenceRange: Codable {
    let minimum: Int?
    let maximum: Int?

    enum CodingKeys: String, CodingKey {
        case minimum = "min"
        case maximum = "max"
    }
}
