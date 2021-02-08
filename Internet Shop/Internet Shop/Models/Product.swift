//
//  Product.swift
//  Internet Shop
//
//  Created by Anelya on 2/8/21.
//  Copyright © 2021 Anelya. All rights reserved.
//

import Foundation

public struct Product: Codable {
    let id: Int?
    let title: String?
    let decription: String?
    let price: Float?
    let image: String?
}
