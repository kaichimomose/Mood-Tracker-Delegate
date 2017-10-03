//
//  Date+convertToString.swift
//  Mood Tracker Delegate
//
//  Created by Kaichi Momose on 2017/10/02.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import Foundation

extension Date {
    func convertToString() -> String {
        return DateFormatter.localizedString(from: self, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.medium)
    }
}
