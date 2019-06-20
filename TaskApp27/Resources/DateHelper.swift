//
//  DateHelper.swift
//  TaskApp27
//
//  Created by Leah Cluff on 6/20/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import Foundation

extension Date {
    func stringValue() -> String{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}
