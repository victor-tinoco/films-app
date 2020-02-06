//
//  Constants.swift
//  cinema
//
//  Created by Victor Martins Tinoco - VTN on 05/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation

struct K {
    static let baseUrl: URL = URL(string: Bundle.main.infoDictionary?["BASE_URL"] as! String)!
}
