//
//  TaskHeaderView.swift
//  ProjectManager
//
//  Created by Kiseok on 1/26/24.
//

import UIKit

final class TaskHeaderView: UICollectionReusableView {
    private let headerLabel: UILabel = {
        let label: UILabel = .init()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let taskCountLabel: UILabel = {
        let label: UILabel = .init()
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textColor = .white
        label.backgroundColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.layer.masksToBounds = true
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepare(text: String, count: Int?) {
        self.headerLabel.text = text
        self.taskCountLabel.text = String(count ?? 0)
    }
}

extension TaskHeaderView {
    private func configureUI() {        
        self.addSubview(headerLabel)
        self.addSubview(taskCountLabel)
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            self.taskCountLabel.heightAnchor.constraint(equalTo: self.taskCountLabel.widthAnchor),
            self.taskCountLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.headerLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.headerLabel.trailingAnchor.constraint(equalTo: self.taskCountLabel.leadingAnchor, constant: -5)
        ])
    }
}
