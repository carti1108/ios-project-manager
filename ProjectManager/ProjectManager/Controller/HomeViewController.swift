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
