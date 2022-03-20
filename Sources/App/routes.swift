import Fluent
import Vapor

func routes(_ app: Application) throws {
//    app.get { req in
//
//        return req.view.render("index", ["title": "Travis Brigman"])
//    }
//
//    try app.register(collection: MainController())
    
    let websiteController = MainController()
    try app.register(collection: websiteController)
}


//func routes(_ app: Application) throws {
//    let controllers: [RouteCollection] = [
//        MainController()
//    ]
//    for controller in controllers {
//        try app.register(collection: controller)
//    }
//}
