
import Fluent
import Vapor

struct MainController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.get(use: projects)
    }

    func projects(req: Request) async throws -> View {
        let cards = [
            Card(
                title: "Rare",
                description: "A blogging platform project similar to Medium"
            ),
            Card(
                title: "Personal Site",
                description: "The page you are viewing now is built with Vapor and Bulma"
            ),
            Card(
                title: "HCA Healthcare's UXCoE",
                description: "The User Experience Center of Excellence wanted a custom page not hosted on a rigid CMS."
            ),
            Card(
                title: "Seat Geek",
                description: "This started off as a code challenge but I am proud of the results."
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
}

