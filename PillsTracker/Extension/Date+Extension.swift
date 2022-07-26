//
//  String+Extension.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 26/07/22.
//

import Foundation


extension Date {
    func asFormattedString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: self)
    }
    
    func asString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd:h:mm a"
        return formatter.string(from: self)
    }
    
}
