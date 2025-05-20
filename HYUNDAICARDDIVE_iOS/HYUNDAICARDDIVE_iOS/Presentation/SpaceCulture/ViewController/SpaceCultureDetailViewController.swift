import UIKit

enum Metric {
    static let collectionViewHeight = 375.0
    static let cellWidth = 422.0
}

final class SpaceCultureDetailViewController: BaseViewController {
    
    private let articlesData = SpaceCultureDetailModel.makeData()
    private let spaceCultureDetailView = SpaceCultureDetailView()
    private lazy var expandedArticle = makeExpandedArticleList(articlesData)
    
    override func loadView() {
        view = spaceCultureDetailView
    }
    
    override func viewDidLoad() {
        setNavigationBar(type: .backButton)
        setDelegate()
        setAction()
        spaceCultureDetailView.articleView.configurePageControl(articleCount: articlesData.articleList.count)
        spaceCultureDetailView.designLibraryHeaderView.dataBind(item: articlesData)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        spaceCultureDetailView.articleView.collectionView.layoutIfNeeded()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            self?.spaceCultureDetailView.articleView.startAutoScroll()
        }
    }
    
    override func setDelegate() {
        spaceCultureDetailView.articleView.collectionView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.register(ArticleCell.self, forCellWithReuseIdentifier: ArticleCell.reuseIdentifier)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let collectionView = spaceCultureDetailView.articleView.collectionView
        if collectionView.contentOffset.x == 0 {
            let offsetX = collectionView.frame.width
            collectionView.setContentOffset(.init(x: offsetX, y: collectionView.contentOffset.y), animated: false)
        }
    }
    
    override func setAction() {
        spaceCultureDetailView.designLibraryMenuView.introduceSpaceButton.addTarget(self, action: #selector(spaceButtonDidTap), for: .touchUpInside)
    }
    
    @objc func spaceButtonDidTap() {
        self.navigationController?.pushViewController(SpaceInfoViewController(), animated: false)
    }
}

extension SpaceCultureDetailViewController {
    func makeExpandedArticleList(_ data: SpaceCultureDetailModel) -> [ArticleModel]  {
        guard let first = data.articleList.first, let last = data.articleList.last else {
            return data.articleList
        }
        
        let expandedArticle = [last] + data.articleList + [first]
        return expandedArticle
    }
}

extension SpaceCultureDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 422)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        let offsetX = scrollView.contentOffset.x
        let count = expandedArticle.count

        if offsetX >= width && offsetX < width * CGFloat(count - 1) {
            let currentPage = Int((offsetX - width + width / 2) / width)
            spaceCultureDetailView.articleView.pageControl.currentPage = currentPage
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let count = expandedArticle.count
        let width = scrollView.frame.width
        let currentIndex = Int(scrollView.contentOffset.x / width)

        if currentIndex == 0 {
            scrollView.setContentOffset(.init(x: width * CGFloat(count - 2), y: 0), animated: false)
        } else if currentIndex == count - 1 {
            scrollView.setContentOffset(.init(x: width, y: 0), animated: false)
        }
    }
}

extension SpaceCultureDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return expandedArticle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArticleCell.reuseIdentifier, for: indexPath) as? ArticleCell else {
            return UICollectionViewCell()
        }
        cell.dataBind(item: expandedArticle[indexPath.row], row: indexPath.row)
        cell.prepare(expandedArticle[indexPath.item].image, expandedArticle[indexPath.item].title)
        return cell
    }
}
