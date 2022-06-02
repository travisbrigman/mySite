import Vapor

struct Card: Encodable {
    let title: String
    let description: String
    let imagePath: String?
    let icon: String?
    let linkRoute: String?
}
