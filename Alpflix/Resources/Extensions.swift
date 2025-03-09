//
//  Extensions.swift
//  Alpflix
//
//  Created by Alperen Çerkez on 3.03.2025.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
