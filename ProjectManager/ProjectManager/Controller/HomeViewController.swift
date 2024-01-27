//
//  ProjectManager - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class HomeViewController: UIViewController {
    private let todoCollectionView: TaskListViewController = .init(taskData: Todo.sampleData)
    private let doingCollectionView: TaskListViewController = .init(taskData: Todo.sampleData)
    private let doneCollectionView: TaskListViewController = .init(taskData: Todo.sampleData)
    private let stackView: UIStackView = {
        let stackView: UIStackView = .init()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.backgroundColor = .systemBackground
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigation()
        configureUI()
        configureLayout()
    }
}

extension HomeViewController {
    private func configureUI() {
        self.stackView.addArrangedSubview(todoCollectionView.view)
        self.stackView.addArrangedSubview(doingCollectionView.view)
        self.stackView.addArrangedSubview(doneCollectionView.view)
        
        self.view.addSubview(self.stackView)
        self.view.backgroundColor = .systemBackground
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func configureNavigation() {
        self.navigationItem.title = "Project Manager"
    }
}
