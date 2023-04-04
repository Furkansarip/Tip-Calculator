//
//  BillInputView.swift
//  TipCalculator
//
//  Created by Furkan Sarı on 4.04.2023.
//

import UIKit

class BillInputView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        backgroundColor = .systemPink
    }
}
