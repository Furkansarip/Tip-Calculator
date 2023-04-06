//
//  HeaderView.swift
//  TipCalculator
//
//  Created by Furkan Sarı on 6.04.2023.
//

import UIKit

class HeaderView: UIView {
    
    private let topLabel : UILabel = {
        LabelHelper.buildLabel(
            text: nil,
            font: ThemeFont.bold(ofSize: 18))
    }()
    
    private let bottomLabel : UILabel = {
        LabelHelper.buildLabel(
            text: nil,
            font: ThemeFont.regular(ofSize: 16))
    }()
    
    private let topSpacerView = UIView()
    private let bottomSpacerView = UIView()
    
    private lazy var stackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            topSpacerView,
            topLabel,
            bottomLabel,
            bottomSpacerView
        ])
        stackView.axis = .vertical
        stackView.alignment = .leading
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        topSpacerView.snp.makeConstraints { make in
            make.height.equalTo(bottomSpacerView)
        }
    }
    
    func configure(topText: String, bottomText:String) {
        topLabel.text = topText
        bottomLabel.text = bottomText
    }
    
}
