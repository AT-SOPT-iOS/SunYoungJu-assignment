//
//  String+.swift
//  SOPT36_WEEK2
//
//  Created by 선영주 on 4/25/25.
//

import Foundation

extension String {

    var isValidEmail: Bool {
        let regex = "^[A-Z0-9a-z._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,}$"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }

    var isValidPassword: Bool {
        let regex = "^(?=.*[!_@$%^&+=])[A-Za-z0-9!_@$%^&+=]{8,12}$"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }

    var isValidNickname: Bool {
        let regex = "^[가-힣]{1,10}$"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
}
