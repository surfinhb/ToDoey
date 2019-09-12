//
//  item.swift
//  todoey
//
//  Created by Jake Shapiro on 9/8/19.
//  Copyright © 2019 Jake Shapiro. All rights reserved.
//

import Foundation

class Item: Codable {
    var text = ""
    var check = false
    init(_ text: String, _ check: Bool = false){
        self.text = text
        self.check = check
    }
}
