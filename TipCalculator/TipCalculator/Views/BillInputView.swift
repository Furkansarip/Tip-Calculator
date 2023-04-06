//
//  BillInputView.swift
//  TipCalculator
//
//  Created by Furkan Sarı on 4.04.2023.
//

import UIKit

class BillInputView: UIView {
    
    private let headerView : HeaderView = {
        let view = HeaderView()
        view.configure(topText: "Enter", bottomText: "your bill")
        return view
    }()
    
    private let textFieldContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addCornerRadius(radius: 8.0)
        return view
    }()
    
    private let currencyDenominationLabel: UILabel = {
        let label =  LabelHelper.buildLabel(text: "$", font: ThemeFont.bold(ofSize: 24))
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private lazy var textField : UITextField = {
        let textField = UITextField()
        textField.setContentHuggingPriority(.defaultLow, for: .horizontal)
        textField.keyboardType = .decimalPad
        textField.borderStyle = .none
        textField.font = ThemeFont.demiBold(ofSize: 28)
        textField.tintColor = ThemeColor.text
        textField.textColor = ThemeColor.text
        //Add toolbar
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: 36))
        toolbar.barStyle = .default
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTapped))
        toolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            doneButton
        ]
        toolbar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolbar
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        addSubview(headerView)
        addSubview(textFieldContainerView)
        headerView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalTo(textFieldContainerView.snp.centerY)
            make.width.equalTo(68)
            make.trailing.equalTo(textFieldContainerView.snp.leading).offset(-24)
        }
        
        textFieldContainerView.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
        }
        
        textFieldContainerView.addSubview(currencyDenominationLabel)
        textFieldContainerView.addSubview(textField)
        
        currencyDenominationLabel.snp.makeConstraints { make in
            make.leading.equalTo(textFieldContainerView.snp.leading).offset(16)
            make.top.bottom.equalToSuperview()
        }
        
        textField.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(currencyDenominationLabel.snp.trailing).offset(16)
            make.trailing.equalTo(textFieldContainerView.snp.trailing).offset(-16)
        }
    }
    
    @objc func doneButtonTapped() {
        textField.endEditing(true)
    }
}


