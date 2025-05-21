import UIKit
import Kingfisher

final class SpaceCultureViewController: BaseViewController {
    
    private let spaceCultureService = SpaceCultureService()
    
    private let spaceCultureView = SpaceCultureView()
    
    private var whatsOnItems: [WhatsOn] = []
    private let spaceItems = SpaceModel.makeData()
    private let cultureItems = CultureModel.makeData()
    private let spaceCultureCells = [WhatsOnCell.self, SpaceCell.self, CultureCell.self]
    private let spaceCultureHeaders = [WhatsOnHeaderView.self, SpaceHeaderView.self, CultureHeaderView.self]
    
    override func loadView() {
        view = spaceCultureView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBar(type: .spaceAndCulture)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setDelegate()
        
        Task {
            await fetchWhatsOn()
        }
    }
    
    override func setView() {
        view.backgroundColor = .white
    }
    
    override func setDelegate() {
        spaceCultureView.collectionView.delegate = self
        spaceCultureView.collectionView.dataSource = self
        registerCells()
    }
    
    private func registerCells() {
        let collectionView = spaceCultureView.collectionView
        
        register(spaceCultureCells, on: collectionView)
        register(spaceCultureHeaders, on: collectionView)
    }
    
    private func register(_ types: [BaseCollectionViewCell.Type], on collectionView: UICollectionView) {
        types.forEach {
            collectionView.register($0, forCellWithReuseIdentifier: $0.reuseIdentifier)
        }
    }
    
    private func register(_ types: [BaseCollectionReusableView.Type], on collectionView: UICollectionView) {
        types.forEach {
            collectionView.register($0,
                                    forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                    withReuseIdentifier: $0.reuseIdentifier)
        }
    }
}

extension SpaceCultureViewController {
    func fetchWhatsOn() async {
        do {
            let data = try await spaceCultureService.fetch()
            whatsOnItems = data.dataList
            
            DispatchQueue.main.async {
                self.spaceCultureView.collectionView.reloadData()
            }
        } catch {
            print("❌ 데이터 로딩 실패: \(error.localizedDescription)")
        }
    }
}

extension SpaceCultureViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0 {
            self.navigationController?.pushViewController(SpaceCultureDetailViewController(), animated: false)
        }
    }
}

extension SpaceCultureViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return SectionType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let section = SectionType(rawValue: section) else {
            return 0
        }
        switch section {
        case .whatsOn:
            return whatsOnItems.count
        case .space:
            return spaceItems.count
        case .culture:
            return cultureItems.count
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let section = SectionType(rawValue: indexPath.section) else {
            return UICollectionViewCell()
        }
        switch section {
        case .whatsOn:
            return dequeCell(WhatsOnCell.self, indexPath: indexPath, from: collectionView, item: whatsOnItems)
            
        case .space:
            return dequeCell(SpaceCell.self, indexPath: indexPath, from: collectionView, item: spaceItems)
            
        case .culture:
            return dequeCell(CultureCell.self, indexPath: indexPath, from: collectionView, item: cultureItems)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        let section = SectionType(rawValue: indexPath.section)!
        
        switch section {
        case .whatsOn:
            return dequeueHeader(WhatsOnHeaderView.self, kind: kind, indexPath: indexPath, from: collectionView)
            
        case .space:
            return dequeueHeader(SpaceHeaderView.self, kind: kind, indexPath: indexPath, from: collectionView)
            
        case .culture:
            return dequeueHeader(CultureHeaderView.self, kind: kind, indexPath: indexPath, from: collectionView)
        }
    }
    
    private func dequeCell<T: BaseCollectionViewCell & DataBindableCell>(
        _ type: T.Type,
        indexPath: IndexPath,
        from collectionView: UICollectionView,
        item: [T.DataType]
    ) -> T {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
        
        cell.dataBind(item: item[indexPath.row])
        return cell
    }
    
    private func dequeueHeader<T: BaseCollectionReusableView>(
        _ type: T.Type,
        kind: String,
        indexPath: IndexPath,
        from collectionView: UICollectionView
    ) -> T {
        return collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: T.reuseIdentifier,
            for: indexPath
        ) as! T
    }
}
