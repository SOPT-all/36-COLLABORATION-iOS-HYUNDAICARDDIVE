//
import UIKit

class DesingLibraryCheckInView: BaseView {
    
    private let checkInView = UIView()
    private let checkInLabel = UILabel()
    private let barcodeImageView = UIImageView()
    
    override func setStyle() {
        checkInView.do{
            $0.backgroundColor = .white
        }
        
        checkInLabel.do {
            $0.text = "라이브러리 체크인"
            $0.textColor = .black
            $0.textAlignment = .center
            $0.font = .custom(.ns_sb_16)
        }
        
        barcodeImageView.do {
            $0.image = .iosImgBarcord
            $0.contentMode = .scaleAspectFit
        }
    }
    
    override func setUI() {
        checkInView.addSubviews(checkInLabel, barcodeImageView)
        addSubview(checkInView)
    }
    
    override func setLayout() {
        checkInView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview().offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(327)
            $0.height.equalTo(120)
        }
        
        checkInLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.centerX.equalToSuperview()
        }
        
        barcodeImageView.snp.makeConstraints {
            $0.top.equalTo(checkInLabel.snp.bottom).offset(7)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(263)
            $0.height.equalTo(60)
        }
    }
}
