//
//  LogoView.swift
//  TipCalculator
//
//  Created by Furkan Sarı on 4.04.2023.
//

import UIKit

class LogoView: UIView {
    
    private let imageView : UIImageView = {
        let image = UIImageView(image: .init(named: "icCalculatorBW"))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let topLabel : UILabel = {
        let label = UILabel()
        let text = NSMutableAttributedString(string: "Mr TIP", attributes: [.font: ThemeFont.demiBold(ofSize: 16)])
        text.addAttributes([.font: ThemeFont.bold(ofSize: 24)], range: NSMakeRange(3, 3))
        label.attributedText = text
        return label
    }()
    
    private let bottomLabel : UILabel = {
        LabelHelper.buildLabel(text: "Calculator", font: ThemeFont.demiBold(ofSize: 20), textAlignment: .left)
    }()
    
    private lazy var vStackView : UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [
       topLabel,
       bottomLabel
       ])
        stackView.axis = .vertical
        stackView.spacing = -4
        return stackView
    }()
    
    private lazy var hStackView : UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [
       imageView,
       vStackView
       ])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
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
        addSubview(hStackView)
        hStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        imageView.snp.makeConstraints { make in
            make.height.equalTo(imageView.snp.width)
        }
    }
}



