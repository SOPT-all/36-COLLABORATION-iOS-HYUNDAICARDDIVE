//
//  SpaceInfoViewController.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by MaengKim on 5/16/25.
//

import UIKit

import SnapKit
import Then
import Kingfisher

final class SpaceInfoViewController: BaseViewController {
    
    
    private let rootView = SpaceInfoView()
    
    private let service: SpaceInfoService = SpaceInfoService()
    private var reviewList: [Review] = []
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        
        setDelegate()
        setRegister()
        
        Task {
            await fetchSpaceInfo()
        }
    }
    
    override func setAction() {
        
        rootView.backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
    }
    
    override func setDelegate() {
        rootView.visitorView.visitorListCollectionView.delegate = self
        rootView.visitorView.visitorListCollectionView.dataSource = self
    }
}

// MARK: - Func

private extension SpaceInfoViewController {
    func setRegister() {
        rootView.visitorView.visitorListCollectionView.register(
            VisitorListCollectionViewCell.self,
            forCellWithReuseIdentifier: VisitorListCollectionViewCell.reuseIdentifier
        )
    }
    
    func fetchSpaceInfo() async {
        do {
            let data = try await service.fetchSpaceInfo()
            self.reviewList = data.reviewList
            
            DispatchQueue.main.async {
                self.rootView.dataBind(imageURL: data.banner)
                self.rootView.cardInfoView.dataBind(spaceIntroduction: data.introduction)
                self.rootView.mapView.dataBind(address: data.address)
                self.rootView.questionView.dataBind(
                    telephone: data.telephone,
                    email: data.email
                )
                self.rootView.visitorView.visitorListCollectionView.reloadData()
            }
        } catch {
            print("❌ 데이터 로딩 실패: \(error.localizedDescription)")
        }
    }
}


extension SpaceInfoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        reviewList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VisitorListCollectionViewCell.reuseIdentifier, for: indexPath) as? VisitorListCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let review = reviewList[indexPath.item]
        cell.dataBind(review)
        cell.delegate = self
        cell.setAction()
        return cell
    }
}

extension SpaceInfoViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let inset: CGFloat = 20
        let width = collectionView.bounds.width - inset
        let height = collectionView.bounds.height
        return CGSize(width: width, height: height)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 20
    }
}

extension SpaceInfoViewController: VisitorListCollectionViewCellDelegate {
    func likeButtondDidtap(in cell: VisitorListCollectionViewCell) {
        guard let indexPath = rootView.visitorView.visitorListCollectionView.indexPath(for: cell) else { return }
        
        var updatedReview = reviewList[indexPath.item]
        updatedReview.isLiked.toggle()
        updatedReview.likeCount += updatedReview.isLiked ? 1 : -1
        reviewList[indexPath.item] = updatedReview

        cell.dataBind(updatedReview)
    }
}



