
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
                icon: "fa-solid fa-droplet",
                linkRoute: "rare"
            ),
            Card(
                title: "Personal Site",
                description: "The page you are viewing now is built with Vapor and Bulma",
                imagePath: nil,
                icon: "fa-solid fa-droplet",
                linkRoute: "personal-site"
                
            ),
            Card(
                title: "HCA Healthcare's UXCoE",
                description: "The User Experience Center of Excellence wanted a custom page not hosted on a rigid CMS.",
                imagePath: nil,
                icon: "fa-brands fa-react",
                linkRoute: "uxcoe"
                
            ),
            Card(
                title: "Seat Geek",
                description: "This started off as a code challenge but I am proud of the results.",
                imagePath: "/images/portfolio/FetchNow.jpg",
                icon: "fa-brands fa-swift",
                linkRoute: "seat-geek"
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
        
        let projectDetails = [
            DetailContext(name: "seat-geek", title: "Seat Geek", description: "This is a code challenge I did for a company called FetchNow. It consumes a list of events from the SeatGeek API and displays them in a list. A user can tap a list item and see a detail view of that item. The user can like the event in the detail view and see liked events back in the table view. The likes persist even if the app is closed.", imageURL: "/images/portfolio/tandemQuiz.jpg"),
            DetailContext(name: "rare", title: "Rare", description: "Rare started off as class project in the bootcamp I attended. I rebuilt the backend in the Vapor framework. A framework for building server-side Swift apps. The front-end is built in React and styled by me in Grommet UI framework.", imageURL: "/images/portfolio/rare.jpg")

        ]
        let name = req.parameters.get("name")!
        let index = projectDetails.firstIndex(where: {$0.name == name}) ?? 0
        let context = projectDetails[index]
        return try await req.view.render("project-detail", context)
    }
}


