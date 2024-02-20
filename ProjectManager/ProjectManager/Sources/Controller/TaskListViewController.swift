//
//  ListViewController.swift
//  ProjectManager
//
//  Created by Kiseok on 1/25/24.
//

import UIKit

final class TaskListViewController: UIViewController {
    private enum Section {
        case main
    }
    
    static let sectionHeaderElementKind = "section-header-element-kind"
    
    private let listCollectionView: UICollectionView = {
        let layout: UICollectionViewCompositionalLayout = UICollectionViewCompositionalLayout {sectionIndex, layoutEnvironment in
            var listLayout = UICollectionLayoutListConfiguration(appearance: .grouped)
            listLayout.headerMode = .supplementary
            
            let headerSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(60)
            )
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: TaskListViewController.sectionHeaderElementKind,
                alignment: .top
            )
            let section = NSCollectionLayoutSection.list(
                using: listLayout,
                layoutEnvironment: layoutEnvironment
            )
            section.interGroupSpacing = 10
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
            section.boundarySupplementaryItems = [sectionHeader]
            
            return section
        }
        
        let collectionView: UICollectionView = .init(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        
        return collectionView
    }()
    private var dataSource: UICollectionViewDiffableDataSource<Section, Todo>?
    private var taskData: [Todo]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setUpLayout()
        setUpDataSource()
        setUpSnapshot()
    }
    
    init(taskData: [Todo]? = nil) {
        self.taskData = taskData
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TaskListViewController {
    private func setUpDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<TaskListCell, Todo> { cell, indexPath, itemIdentifier in
            guard let taskData = self.taskData else {
                return
            }
            
            cell.configure(taskData[indexPath.row])
        }
        
        let headerRegistration = UICollectionView.SupplementaryRegistration<TaskHeaderView>(elementKind: TaskListViewController.sectionHeaderElementKind) { supplementaryView, elementKind, indexPath in
            supplementaryView.layer.borderWidth = 0.5
            supplementaryView.layer.borderColor = UIColor.systemGray4.cgColor
            supplementaryView.prepare(text: "TODO", count: 5)
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: listCollectionView,
                                                        cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(
                using: cellRegistration,
                for: indexPath,
                item: itemIdentifier
            )
            
            return cell
        })
        
        dataSource?.supplementaryViewProvider = { view, kind, index in
            return self.listCollectionView.dequeueConfiguredReusableSupplementary(using: headerRegistration, for: index)
        }
    }
    
    private func setUpSnapshot() {
        guard let taskData = taskData else {
            return
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Todo>()
        snapshot.appendSections([.main])
        snapshot.appendItems(taskData)
        
        dataSource?.apply(snapshot)
    }
}

extension TaskListViewController {
    private func configureUI() {
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(self.listCollectionView)
    }
    
    private func setUpLayout() {
        NSLayoutConstraint.activate([
            self.listCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.listCollectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.listCollectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.listCollectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
