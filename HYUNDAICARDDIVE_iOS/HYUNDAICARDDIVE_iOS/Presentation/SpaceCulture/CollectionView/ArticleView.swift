import UIKit

final class ArticleView: BaseCollectionReusableView {
    
    private var autoScrollTimer: Timer?
    
    private let flowLayout = UICollectionViewFlowLayout()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    let pageControl = UIPageControl()
    
    override func setStyle() {
        flowLayout.scrollDirection = .horizontal
        
        collectionView.do {
            $0.backgroundColor = .white
            $0.isPagingEnabled = true
            $0.contentInset = .zero
        }
        
        pageControl.do {
            $0.pageIndicatorTintColor = .white40
            $0.currentPageIndicatorTintColor = .white
        }
    }
    
    override func setUI() {
        addSubviews(collectionView, pageControl)
    }
    
    override func setLayout() {
        collectionView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(422)
        }
        
        pageControl.snp.makeConstraints {
            $0.bottom.equalTo(collectionView.snp.bottom).offset(-8)
            $0.centerX.equalToSuperview()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        DispatchQueue.main.async {
            if self.collectionView.numberOfItems(inSection: 0) > 1 {
                self.collectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .centeredHorizontally, animated: false)
            }
        }
    }
}

extension ArticleView {
    func configurePageControl(articleCount: Int) {
        pageControl.numberOfPages = articleCount
        pageControl.currentPage = 0
    }
    
    func scrollToNextItem() {
        let visibleIndex = Int(collectionView.contentOffset.x / collectionView.frame.width)
        let itemCount = collectionView.numberOfItems(inSection: 0)
        guard itemCount > 0 else { return }

        let nextIndex = visibleIndex + 1
        let offsetX = CGFloat(nextIndex) * collectionView.frame.width

        UIView.animate(withDuration: 0.3, animations: {
            self.collectionView.contentOffset.x = offsetX
        }) { [weak self] _ in
            guard let self = self else { return }

            let correctedIndex: Int
            if nextIndex == itemCount - 1 {
                correctedIndex = 1
                self.collectionView.setContentOffset(.init(x: self.collectionView.frame.width, y: 0), animated: false)
            } else {
                correctedIndex = nextIndex
            }

            let page = (correctedIndex - 1 + (itemCount - 2)) % (itemCount - 2)
            self.pageControl.currentPage = page
        }
    }


    func startAutoScroll() {
        stopAutoScroll()
        autoScrollTimer = Timer.scheduledTimer(withTimeInterval: 4.0, repeats: true) { [weak self] _ in
            self?.scrollToNextItem()
        }
    }

    func stopAutoScroll() {
        autoScrollTimer?.invalidate()
        autoScrollTimer = nil
    }
}
