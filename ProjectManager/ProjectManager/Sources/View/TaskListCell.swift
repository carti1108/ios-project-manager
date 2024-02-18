//
//  listCell.swift
//  ProjectManager
//
//  Created by Kiseok on 1/24/24.
//

import UIKit

final class TaskListCell: UICollectionViewCell, ReuseIdentifiable {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textColor = .systemGray
        label.numberOfLines = 3
        
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView: UIStackView = .init()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.configure(nil)
    }
    
    func configure(_ task: Todo?) {
        guard let task = task else {
            return
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        
        let date = task.dueDate
        
        self.titleLabel.text = task.title
        self.descriptionLabel.text = task.description
        self.dateLabel.text = dateFormatter.string(from: date)
    }
}

extension TaskListCell {
    private func configureUI() {
        self.stackView.addArrangedSubview(self.titleLabel)
        self.stackView.addArrangedSubview(self.descriptionLabel)
        self.stackView.addArrangedSubview(self.dateLabel)
        
        self.contentView.addSubview(stackView)
        self.contentView.backgroundColor = .white
    }
    
    private func setUpLayout() {
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.trailingAnchor)
        ])
    }
}
