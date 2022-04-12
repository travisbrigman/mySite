struct DetailContext: Encodable {
    let name: String
    let title: String
    let description: String
    let imageURL: String
    let liveSite: String?
    let gitHubRepo: String?
}
