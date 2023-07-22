//
//  HomeScreen.swift
//  Arquiteturas
//
//  Created by Felipe Augusto Correia on 22/07/23.
//

import UIKit

class HomeScreen: UIView {
    
    //MARK: - Properties
    lazy var welcomeLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Seja bem vindo a home"
        lb.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        lb.textColor = UIColor.white
        lb.textAlignment = .center
        lb.lineBreakMode = .byWordWrapping
        lb.numberOfLines = .zero
        return lb
    }()
    
    //MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemMint
        addElements()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(welcomeLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            welcomeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
