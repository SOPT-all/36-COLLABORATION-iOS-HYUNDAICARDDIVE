import UIKit

struct SpaceModel {
    let image: UIImage
    let description: String
    
    static func makeData() -> [Self] {
        return [
            SpaceModel(
                image: .logoDesignlib,
                description: "시대의 초월한\n디자인과의 조우"
            ),
            SpaceModel(
                image: .logoMusiclib,
                description: "바이닐에서 영감을"
            ),
            SpaceModel(
                image: .logoCookinglib,
                description: "쿠킹의 모든것"
            ),
            SpaceModel(
                image: .logoArtlib,
                description: "컨템포러리\n아트 스페이스"
            ),
            SpaceModel(
                image: .logoUnderstage,
                description: "다양한 문화 집결의\n공연장"
            ),
            SpaceModel(
                image: .logoVinyl,
                description: "음악을 보고 듣고\n소유하는"
            ),
            SpaceModel(
                image: .logoStorage,
                description: "장르를 넘나드는\n실험적 전시 공간"
            ),
            SpaceModel(
                image: .logoIron,
                description: "프리미엄 회원을 위한\n골프 공간"
            ),
            SpaceModel(
                image: .logoRed11,
                description: "브랜디를 통한\n새로운 경험"
            ),
            SpaceModel(
                image: .logoCard,
                description: "카드를 위한\n오픈 팩토리"
            )
        ]
    }
}
