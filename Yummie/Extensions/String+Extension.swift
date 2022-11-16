//
//  String+Extension.swift
//  Yummie
//
//  Created by Lucas Barroso IZ on 16/11/2022.
//

import Foundation

// extension created to easily use a url string as a URL
extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
