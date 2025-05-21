struct SpaceCultureResponseDto: Decodable {
    let dataList: [WhatsOn]
}

struct WhatsOn: Decodable {
    let date: String
    let title: String
    let description: String
    let stage: String
    let location: String
    let reservation: Bool
    let image: String
}
