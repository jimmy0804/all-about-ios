import UIKit
import PlaygroundSupport

struct ListItem {
    let systemIcon: String
    let title: String
}

extension ListItem: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(systemIcon)
        hasher.combine(title)
    }
}

class MyViewController: UICollectionViewController {

    enum Section: Int {
        case list, grid
    }
    
    private lazy var dataSource: UICollectionViewDiffableDataSource<Section, ListItem> = {
        UICollectionViewDiffableDataSource<Section, ListItem>(collectionView: collectionView) { (collectionView: UICollectionView, indexPath, itemIdentifier) -> UICollectionViewCell? in
            
            switch Section(rawValue: indexPath.section)! {
            case .list:
                return collectionView.dequeueConfiguredReusableCell(
                    using: self.listCellRegistation,
                    for: indexPath,
                    item: itemIdentifier
                )
            case .grid:
                return collectionView.dequeueConfiguredReusableCell(
                    using: self.gridCellRegistation,
                    for: indexPath,
                    item: itemIdentifier
                )
            }
        }
    }()
    
    private lazy var listCellRegistation: UICollectionView.CellRegistration<UICollectionViewListCell, ListItem> = {
        UICollectionView.CellRegistration<UICollectionViewListCell, ListItem> { cell, indexPath, item in
            var contentConfig = cell.defaultContentConfiguration()
            contentConfig.text = item.title
            contentConfig.image = UIImage(systemName: item.systemIcon)
            cell.contentConfiguration = contentConfig
        }
    }()
    
    private lazy var gridCellRegistation: UICollectionView.CellRegistration<UICollecionView, ListItem> = {
        UICollectionView.CellRegistration<UICollectionViewCell, ListItem> { cell, indexPath, item in
            var contentConfig = cell.defaultContentConfiguration()
            contentConfig.text = item.title
            contentConfig.image = UIImage(systemName: item.systemIcon)
            cell.contentConfiguration = contentConfig
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applySnapshot()
    }
    
    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, ListItem>()
        snapshot.appendSections([.list, .grid])
        snapshot.appendItems([
            .init(systemIcon: "questionmark.circle.fill", title: "1"),
            .init(systemIcon: "questionmark.circle.fill", title: "2")
        ], toSection: .list)
        
        snapshot.appendItems([
            .init(systemIcon: "questionmark.circle.fill", title: "1"),
            .init(systemIcon: "questionmark.circle.fill", title: "2")
        ], toSection: .grid)
        
        dataSource.apply(snapshot)
    }
}
// Present the view controller in the Live View window
let layoutConfig = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
let listLayout = UICollectionViewCompositionalLayout.list(using: layoutConfig)
PlaygroundPage.current.liveView = MyViewController(collectionViewLayout: listLayout)



