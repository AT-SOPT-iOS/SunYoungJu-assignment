//
//  UIFont+.swift
//  SOPT36_WEEK2
//
//  Created by 선영주 on 4/20/25.
//

import UIKit

extension UIFont {
    
    // MARK: - Pretendard Custom Fonts

    static func pretendardBold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Pretendard-Bold", size: size)!
    }

    static func pretendardExtraBold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Pretendard-ExtraBold", size: size)!
    }

    static func pretendardMedium(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Pretendard-Medium", size: size)!
    }

    static func pretendardSemiBold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Pretendard-SemiBold", size: size)!
    }
}
