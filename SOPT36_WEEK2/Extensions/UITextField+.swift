//
//  UITextField+.swift
//  SOPT36_WEEK2
//
//  Created by 선영주 on 4/20/25.
//

import UIKit

// MARK: - UI Styling Utilities

extension UITextField {
    
    func setLeftPadding(_ value: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: value, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setPlaceholderColor(_ color: UIColor) {
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [
                .foregroundColor: color,
                .font: font
            ].compactMapValues { $0 }
        )
    }
    
    func addUnderline(color: UIColor = .gray2, height: CGFloat = 1.0) {
        let underline = UIView()
        underline.backgroundColor = color
        addSubview(underline)
        underline.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            underline.leadingAnchor.constraint(equalTo: leadingAnchor),
            underline.trailingAnchor.constraint(equalTo: trailingAnchor),
            underline.bottomAnchor.constraint(equalTo: bottomAnchor),
            underline.heightAnchor.constraint(equalToConstant: height)
        ])
    }
}

// MARK: - Focus Border Behavior

private var borderColorKey: UInt8 = 0
private var borderInactiveColorKey: UInt8 = 1
private var borderWidthKey: UInt8 = 2

extension UITextField {
    
    func enableFocusBorderChange(
        activeColor: UIColor = .white,
        inactiveColor: UIColor = .clear,
        borderWidth: CGFloat = 1
    ) {
        self.addTarget(self, action: #selector(startEditing), for: .editingDidBegin)
        self.addTarget(self, action: #selector(handleEndEditing), for: .editingDidEnd)
        
        objc_setAssociatedObject(self, &borderColorKey, activeColor, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        objc_setAssociatedObject(self, &borderInactiveColorKey, inactiveColor, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        objc_setAssociatedObject(self, &borderWidthKey, borderWidth, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }

    @objc private func startEditing() {
        if let activeColor = objc_getAssociatedObject(self, &borderColorKey) as? UIColor,
           let borderWidth = objc_getAssociatedObject(self, &borderWidthKey) as? CGFloat {
            layer.borderColor = activeColor.cgColor
            layer.borderWidth = borderWidth
        }
    }

    @objc private func handleEndEditing() {
        if let inactiveColor = objc_getAssociatedObject(self, &borderInactiveColorKey) as? UIColor {
            layer.borderColor = inactiveColor.cgColor
            layer.borderWidth = 0
        }
    }
}

// MARK: - UIView Extensions

extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
