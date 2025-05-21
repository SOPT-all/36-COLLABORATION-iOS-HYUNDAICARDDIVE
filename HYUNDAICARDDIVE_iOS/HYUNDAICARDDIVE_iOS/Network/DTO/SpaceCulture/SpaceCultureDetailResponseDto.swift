struct SpaceCultureDetailResponseDto: Codable {
    let address: String
    let operationTime: String
    let articleList: [Article]
}

struct Article: Codable {
    let imageUrl: String
    let title: String
    let subTitle: String
    let date: String
}
