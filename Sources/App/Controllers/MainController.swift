
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
            DetailContext(name: "seat-geek", title: "Seat Geek", description: "This is a code challenge I did for a company called FetchNow. It consumes a list of events from the SeatGeek API and displays them in a list. A user can tap a list item and see a detail view of that item. The user can like the event in the detail view and see liked events back in the table view. The likes persist even if the app is closed.", imageURL: "/images/portfolio/tandemQuiz.jpg", liveSite: nil, gitHubRepo:"https://github.com/travisbrigman/FetchNow"),
            DetailContext(name: "rare", title: "Rare", description: "Rare started off as class project in the bootcamp I attended. I rebuilt the backend in the Vapor framework. A framework for building server-side Swift apps. The front-end is built in React and styled by me in Grommet UI framework.", imageURL: "/images/portfolio/rare.jpg", liveSite:"https://rare-client.herokuapp.com/login", gitHubRepo:"https://github.com/travisbrigman/rare-server-vapor"),
            DetailContext(name: "personal-site", title: "My Personal Site", description: "The site you are on now is built with the Swift server side framework Vapor. Each page is a template being rendered as a URL route is called. Even though Vapor is a server side framework, the minimal amount of content being presented is being store with the framework code. Styling is done with the Bulma CSS framework. The reasons behind using Bulma are mostly because it looks great out of the box and I wanted to try something new and different", imageURL: "/images/portfolio/rare.jpg", liveSite: nil, gitHubRepo:"https://github.com/travisbrigman/mySite"),
            DetailContext(name: "uxcoe", title: "HCA Healthcare's User Experience Center of Excellence", description: "This was a project I worked on for the first department I worked in at HCA healthcare. Like any big enterprise, HCA uses a CMS that allows each department to build a site. It's not that great at creating beautiful, well designed sites. They asked me to build a frontend using React and the in house design system Neutron.", imageURL: "/images/portfolio/rare.jpg", liveSite: nil, gitHubRepo: nil)


        ]
        let name = req.parameters.get("name")!
        let index = projectDetails.firstIndex(where: {$0.name == name}) ?? 0
        let context = projectDetails[index]
        return try await req.view.render("project-detail", context)
    }
}


