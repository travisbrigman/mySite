
import Fluent
import Vapor

struct MainController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.get(use: projects)
        routes.get("detail", ":name", use: projectDetail)
    }

    func projects(req: Request) async throws -> View {
        let cards = [
            Card(
                title: "Rare",
                description: "A blogging platform project similar to Medium",
                imagePath: "/images/portfolio/Rare.jpg",
                icon: "fa-solid fa-droplet"
            ),
            Card(
                title: "Personal Site",
                description: "The page you are viewing now is built with Vapor and Bulma",
                imagePath: nil,
                icon: "fa-solid fa-droplet"
                
            ),
            Card(
                title: "HCA Healthcare's UXCoE",
                description: "The User Experience Center of Excellence wanted a custom page not hosted on a rigid CMS.",
                imagePath: nil,
                icon: "fa-brands fa-react"
                
            ),
            Card(
                title: "Seat Geek",
                description: "This started off as a code challenge but I am proud of the results.",
                imagePath: "/images/portfolio/FetchNow.jpg",
                icon: "fa-brands fa-swift"
            )
        ]

        let context = ProjectsLoopsContext(
            title: "Travis Brigman",
            sectionTitle: "Projects",
            description: "Example Projects I've Worked On",
            cards: cards
        )
        return try await req.view.render("index", context)
    }
    
    func projectDetail(req: Request) async throws -> View {
        let name = req.parameters.get("name")!
        let context = DetailContext(name: name)
        return try await req.view.render("project-detail", context)
    }
}
