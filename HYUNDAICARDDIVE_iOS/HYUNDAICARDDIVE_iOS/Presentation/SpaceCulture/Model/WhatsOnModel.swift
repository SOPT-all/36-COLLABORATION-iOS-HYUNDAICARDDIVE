import UIKit

struct WhatsOnModel {
    let date: String
    let title: String
    let description: String
    let stage: String
    let location: String
    let isReserved: Bool
    let image: UIImage
    
    static func makeData() -> [Self] {
        return [
            WhatsOnModel(
                date: "05/10(토) ~ 06/29(일)",
                title: "현대 회화의 새로운 서사",
                description: "Storage 데이비드 살레 국내 최초\n회고전",
                stage: "스토리지",
                location: "이태원",
                isReserved: false,
                image: .imgWhatson1
            ),
            WhatsOnModel(
                date: "05/10(토) ~ 06/29(일)",
                title: "현대 회화의 새로운 서사",
                description: "Storage 데이비드 살레 국내 최초\n회고전",
                stage: "스토리지",
                location: "이태원",
                isReserved: true,
                image: .imgWhatson2
            ),
            WhatsOnModel(
                date: "05/10(토) ~ 06/29(일)",
                title: "현대 회화의 새로운 서사",
                description: "Storage 데이비드 살레 국내 최초\n회고전",
                stage: "스토리지",
                location: "이태원",
                isReserved: false,
                image: .imgWhatson3
            )
        ]
    }
}
