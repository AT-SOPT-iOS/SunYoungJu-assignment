//
//  UITextField+.swift
//  SOPT36_WEEK2
//
//  Created by 선영주 on 4/20/25.
//

import UIKit

extension UITextField {
    func setLeftPadding(_ value: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: value, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
