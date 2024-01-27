    private enum Section {
        case main
    }
    
    static let sectionHeaderElementKind = "section-header-element-kind"
    
    private lazy var listCollectionView: UICollectionView = {
        let collectionView: UICollectionView = .init(frame: .zero, collectionViewLayout: createLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    private var taskData: [Todo]?
        configureUI()
        configureLayout()
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
