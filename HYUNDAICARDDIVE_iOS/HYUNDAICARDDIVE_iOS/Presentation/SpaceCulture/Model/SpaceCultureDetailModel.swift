import UIKit

struct SpaceCultureDetailModel {
    let address: String
    let operationTime: String
    let articleList: [ArticleModel]
}

struct ArticleModel {
    let image: UIImage
    let title: String
    let subTitle: String
    let date: String
}

extension SpaceCultureDetailModel {
    static func makeData() -> Self {
        return SpaceCultureDetailModel(
            address: "서울시 종로구 북촌로 31-18",
            operationTime: "화~토 12~21시 / 일, 공휴일 12~18시 (설, 추석 연휴 휴관)",
            articleList: [
                ArticleModel(image: .iosImgSpaceDetail1, title: "경계선을 넘나드는 사진가", subTitle: "4월의 디자이너, 다이안 아버스", date: "2025.04.14"),
                ArticleModel(image: .iosImgSpaceDetail2, title: "가장 창의적인 시대의 표상", subTitle: "디자인 라이브러리 전권 보유 컬렉션", date: "2025.03.18"),
                ArticleModel(image: .iosImgSpaceDetail3, title: "한국의 디자인 역사를 품다", subTitle: "월간 <디자인> 전권 보유 컬렉션 구축", date: "2025.05.13"),
                ArticleModel(image: .iosImgSpaceDetail4, title: "초록의 물결", subTitle: "현대카드 라이브러리 5월의 새 책", date: "2025.05.06")
            ]
        )
    }
}
