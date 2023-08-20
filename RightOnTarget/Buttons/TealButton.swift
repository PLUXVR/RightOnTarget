//
//  Button.swift
//  LoginScreenFreshFruits
//
//  Created by Максим Беседин on 27.10.2022.
//

import UIKit

class TealButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }

    private func setupButton() {
        backgroundColor = UIColor.systemTeal
        layer.cornerRadius = frame.size.height / 4
        tintColor = .white
    }
}
