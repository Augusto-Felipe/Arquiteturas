//
//  HomeScreen.swift
//  Arquiteturas
//
//  Created by Felipe Augusto Correia on 21/07/23.
//

import UIKit

class HomeScreen: UIView {
    
    lazy var welcomeLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Bem vindo a home"
        lb.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        lb.textColor = UIColor.white
        lb.textAlignment = .center
        return lb
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemIndigo
        addElements()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(welcomeLabel)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            welcomeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
