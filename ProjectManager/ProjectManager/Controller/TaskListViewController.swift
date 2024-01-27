    private enum Section {
        case main
    }
    
    static let sectionHeaderElementKind = "section-header-element-kind"
    
    private lazy var listCollectionView: UICollectionView = {
        let collectionView: UICollectionView = .init(frame: .zero, collectionViewLayout: createLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    private var dataSource: UICollectionViewDiffableDataSource<Section, Todo>?
    private var taskData: [Todo]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureLayout()
        configureDataSource()
        configureSnapshot()
    }
extension TaskListViewController {
    private func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<TaskListCell, Todo> { cell, indexPath, itemIdentifier in
            guard let taskData = self.taskData else {
                return
            }
            
            cell.configure(taskData[indexPath.row])
        }
        
        let headerRegistration = UICollectionView.SupplementaryRegistration<TaskHeaderView>(elementKind: TaskListViewController.sectionHeaderElementKind) { supplementaryView, elementKind, indexPath in
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
    
    private func configureSnapshot() {
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
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            self.listCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.listCollectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.listCollectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.listCollectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
