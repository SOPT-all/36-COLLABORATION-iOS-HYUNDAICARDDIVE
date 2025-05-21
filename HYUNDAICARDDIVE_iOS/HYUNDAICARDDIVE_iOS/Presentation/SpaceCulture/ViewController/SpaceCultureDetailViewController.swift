import UIKit

enum Metric {
    static let collectionViewHeight = 375.0
    static let cellWidth = 422.0
}

final class SpaceCultureDetailViewController: BaseViewController {
    
    private let spaceCultureDetailService = SpaceCultureDetailService()
    
    private var spaceCultureDetailItem: SpaceCultureDetailResponseDto?
    private var articleItems: [Article] = []
    private lazy var expandedArticle: [Article] = []
    private let spaceCultureDetailView = SpaceCultureDetailView()
    
    override func loadView() {
        view = spaceCultureDetailView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBar(type: .backButton)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setAction()
        
        Task {
            await fetchArticles()
        }
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
    func fetchArticles() async {
        do {
            let data = try await spaceCultureDetailService.fetch()
            spaceCultureDetailItem = data
            
            guard let spaceCultureDetailItem = spaceCultureDetailItem else { return }
            
            articleItems = spaceCultureDetailItem.articleList
            
            DispatchQueue.main.async { [self] in
                self.spaceCultureDetailView.articleView.collectionView.reloadData()
                self.spaceCultureDetailView.designLibraryHeaderView.dataBind(
                    item: spaceCultureDetailItem
                )
                expandedArticle = makeExpandedArticleList(articleItems)
                spaceCultureDetailView.articleView.configurePageControl(
                    articleCount: articleItems.count
                )
                spaceCultureDetailView.designLibraryHeaderView.dataBind(
                    item: spaceCultureDetailItem
                )
            }
        } catch {
            print("❌ 데이터 로딩 실패: \(error.localizedDescription)")
        }
    }
}

extension SpaceCultureDetailViewController {
    func makeExpandedArticleList(_ data: [Article]) -> [Article]  {
        guard let first = articleItems.first, let last = articleItems.last else {
            return articleItems
        }
        
        let expandedArticle = [last] + articleItems + [first]
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
        cell.dataBind(item: expandedArticle[indexPath.row])
        cell.prepare(expandedArticle[indexPath.item].imageUrl, expandedArticle[indexPath.item].title)
        return cell
    }
}
