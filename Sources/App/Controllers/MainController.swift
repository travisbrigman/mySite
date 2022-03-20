
import Fluent
import Vapor

struct MainController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.get(use: projects)
    }

    func projects(req: Request) async throws -> View {
        let cards = [
            Card(
                title: "Cloud",
                description: "Since Vapor run in docker, it can be easily deployed to any cloud hosting."
            ),
            Card(
                title: "SSL Certificates",
                description: "It's a piece of cake easy to setup TLS support. Let's encrypt provides free certificates."

            ),
            Card(
                title: "Testing",
                description: "It's a good practice to automate repetitive tasks. Unit tests are good starting point."
            ),
            Card(
                title: "Security",
                description: "Ever heard about Vapor Secure Headers package? Check GitHub or Vapor discord forum."
            ),
            Card(
                title: "Powerful API",
                description: "Building APIs is the field where Vapor really shines. Build fully functional API within minutes."
            ),
            Card(
                title: "Databases",
                description: "There is an ORM called Fluent. It provides drivers for Postgres, MySQL, SQLite and MongoDB."
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

