//
//  SpaceInfoService.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by MaengKim on 5/16/25.
//

import Foundation

final class SpaceInfoService {
    func fetchSpaceInfo() async throws -> SpaceInfoResponseDTO {
        return try await APIManager.shared.request(api: .spaceDetail, as: SpaceInfoResponseDTO.self)
    }
}

// MockData

final class MockSpaceInfoService {
    func fetchSpaceInfo() async throws -> SpaceInfoResponseDTO {
        return Self.mockData
    }
}

extension MockSpaceInfoService {
    static let mockData = SpaceInfoResponseDTO(
        banner: "https://image.utoimage.com/preview/cp872722/2022/12/202212008462_500.jpg",
        introduction: "현대카드 디자인 라이브러리는 근대 디자인 정신이 태동한 지점인 바우하우스 이후의 디자인, 건축, 현대미술에 관한 1만 9천여 권의 전문서적을 엄선하여 선보인다. 소량 인쇄했거나, 절판된 희귀 도서를 포함해 글로벌 북 큐레이터가 선정한 북 컬렉션과 디자인에 특화된 도서 카테고리에서 디자인 라이브러리의 전문성과 객관성을 발견할 수 있다. \n\n가회동에서 위치한 전통과 현대의 조화로 재해석해 리노베이션 한 라이브러리 공간에서는 다채로운 경험을 선사한다.\n\n바쁜 도시의 급한 발걸음을 잊고 몰입의 시간을 통해 지적인 영감을 얻을 수 있는 공간, 현대카드 디자인 라이브러리이다.",
        address: "서울시 종로구 북촌로 31-18",
        reviewList: [
            Review(imageUrl: "https://github.com/user-attachments/assets/8e891153-c06d-45d7-a26d-0157161eeb29", reviewer: "Clare", likeCount: 1),
            Review(imageUrl: "https://github.com/user-attachments/assets/f9cef653-a9fc-4612-8c24-a2a03c386659", reviewer: "MJ", likeCount: 2)
        ],
        telephone: "02-3700-2700",
        email: "designlibrary@hcs.com"
    )
}
