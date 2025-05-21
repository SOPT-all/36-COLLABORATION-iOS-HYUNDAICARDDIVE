import UIKit

final class ArticleCell: BaseCollectionViewCell, DataBindableCell {
    
    typealias DataType = Article
    
    private let articleImageView = UIImageView()
    private let articleInfoView = UIView()
    private let logoLabel = UILabel()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let dateLabel = UILabel()
    
    override func setStyle() {
        articleImageView.contentMode = .scaleAspectFill
        
        articleInfoView.backgroundColor = .clear
        
        logoLabel.do {
            $0.text = "Article"
            $0.textColor = .white
            $0.textAlignment = .left
            $0.font = UIFont.custom(.yni_16)
        }
        
        titleLabel.do {
            $0.textColor = .white
            $0.textAlignment = .left
            $0.font = UIFont.custom(.ns_sb_20)
        }
        
        subtitleLabel.do {
            $0.textColor = .white
            $0.textAlignment = .left
            $0.font = UIFont.custom(.ns_sb_14)
        }
        
        dateLabel.do {
            $0.textColor = .white
            $0.textAlignment = .left
            $0.font = UIFont.custom(.ns_sb_14)
        }
    }
    
    override func setUI() {
        articleInfoView.addSubviews(logoLabel, titleLabel, subtitleLabel, dateLabel)
        articleImageView.addSubviews(articleInfoView)
        addSubviews(articleImageView)
    }
    
    override func setLayout() {
        articleImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(422)
        }
        
        articleInfoView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(15)
        }
        
        logoLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(10)
            $0.width.equalTo(327)
            $0.height.equalTo(22)
        }
        
        dateLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(8)
            $0.width.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.bottom.equalTo(dateLabel.snp.top).offset(-4)
            $0.width.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.bottom.equalTo(subtitleLabel.snp.top).offset(-2)
            $0.width.equalToSuperview()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        prepare("", nil)
    }
    
    func prepare(_ imageUrl: String, _ text: String?) {
        let url = URL(string: imageUrl)
        articleImageView.kf.setImage(with: url)
        titleLabel.text = text
    }
    
    func dataBind(item: Article) {
        let url = URL(string: item.imageUrl)
        articleImageView.kf.setImage(with: url)
        titleLabel.text = item.title
        subtitleLabel.text = item.subTitle
        dateLabel.text = item.date
    }
}
