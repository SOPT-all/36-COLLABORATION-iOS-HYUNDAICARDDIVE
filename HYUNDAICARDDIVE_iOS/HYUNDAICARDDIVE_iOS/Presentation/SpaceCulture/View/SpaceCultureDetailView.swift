import UIKit

final class SpaceCultureDetailView: BaseView {
    
    private let scrollView = UIScrollView()
    private let contentStackView = UIStackView()
    
    let designLibraryHeaderView = DesignLibraryHeaderView()
    let designLibraryMenuView = DesignLibraryMenuView()
    private let designLibraryCheckInView = DesingLibraryCheckInView()
    let articleView = ArticleView()
    
    override func setStyle() {
        contentStackView.do {
            $0.axis = .vertical
        }
    }
    
    override func setUI() {
        contentStackView.addArrangedSubviews(
            designLibraryHeaderView, designLibraryMenuView, designLibraryCheckInView, articleView
        )
        scrollView.addSubview(contentStackView)
        addSubview(scrollView)
    }
    
    override func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        designLibraryHeaderView.snp.makeConstraints {
            $0.height.equalTo(192)
        }
        
        designLibraryMenuView.snp.makeConstraints {
            $0.height.equalTo(91)
        }
        
        designLibraryCheckInView.snp.makeConstraints {
            $0.height.equalTo(160)
        }
        
        contentStackView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.bottom.equalToSuperview().inset(10)
        }
        
        articleView.snp.makeConstraints {
            $0.top.equalTo(designLibraryCheckInView.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(490)
        }
    }
}
