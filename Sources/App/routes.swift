// import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    let websiteController = MainController()
    try app.register(collection: websiteController)
}

