
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
                imagePath: "/images/portfolio/rare.png",
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
            DetailContext(name: "rare", title: "Rare", description: "Rare started off as class project in the bootcamp I attended. We built the frontend using React and the backend with Django. I did a lot of the styling for the frontend and I was pleased with how it turned out so I decided to rebuild the backend in Vapor after I completed the bootcamp. This was my first Vapor project and I learned a lot! Switching from one framework to another helped reinforce foundational concepts like how databases interact with ORM’s and creating routes. I also learned that switching backends on a site doesn’t mean “you just change some endpoints and you’re done.” I did a lot of refactoring of the React front end to make it work well with the new backend.", imageURL: "/images/portfolio/rare.png", liveSite:"https://rare-client.herokuapp.com/login", gitHubRepo:"https://github.com/travisbrigman/rare-server-vapor"),
            DetailContext(name: "personal-site", title: "My Personal Site", description: "The site you are on now is built with the Swift server side framework Vapor. Each page is a template being rendered as a URL route is called. Even though Vapor is a server side framework, the minimal amount of content being presented is being store with the framework code. Styling is done with the Bulma CSS framework. The reasons behind using Bulma are mostly because it looks great out of the box and I wanted to try something new and different", imageURL: "/images/portfolio/rare.jpg", liveSite: nil, gitHubRepo:"https://github.com/travisbrigman/mySite"),
            DetailContext(name: "uxcoe", title: "HCA Healthcare's User Experience Center of Excellence", description: "This was a project I worked on for the first department I worked in at HCA Healthcare. Like any big enterprise, HCA uses a CMS that allows each department to build a site. It's not that great at creating beautiful, well designed sites. They asked me to build a frontend using React and the in house design system Neutron. The Neutron design system is converted into code using Ionic’s Stencil system. From there, a developer can use any of the most popular Javascript frameworks. I learned a lot about the development process from this site, but I think the biggest takeaway is the importance of design. It’s hard enough coding a site, so it was a relief that I didn’t have to come up with layouts, color palettes, illustrations, etc.", imageURL: "/images/portfolio/rare.jpg", liveSite: nil, gitHubRepo: nil)


        ]
        let name = req.parameters.get("name")!
        let index = projectDetails.firstIndex(where: {$0.name == name}) ?? 0
        let context = projectDetails[index]
        return try await req.view.render("project-detail", context)
    }
}


