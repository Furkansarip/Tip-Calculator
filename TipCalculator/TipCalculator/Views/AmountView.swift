//
//  AmountView.swift
//  TipCalculator
//
//  Created by Furkan Sarı on 5.04.2023.
//

import UIKit


class AmountView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        backgroundColor = .red
    }
}
