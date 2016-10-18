# Bookshelf 
Simple [Vapor](https://github.com/vapor/vapor) web server, in combination with [Protocol Buffers](https://developers.google.com/protocol-buffers/).

[Blog post - part 1](https://blog.codecentric.de/en/2016/10/full-stack-swift-part-1/)
[Blog post - part 2](https://blog.codecentric.de/en/2016/10/full-stack-swift-part-2/) (coming on 21.10.2016)
 
### Contributors 
- Milan Stevanovic - [Twitter](https://twitter.com/FathVader), [LinkedIn](https://rs.linkedin.com/in/milan-stevanović-702985a8).
  
## Project Setup 
### Server
```
$ cd BookshelfServer/
$ swift package generate-xcodeproj
$ open BookshelfServer.xcodeproj
```
Be sure to select the BookshelfServer console application build scheme before running the project.

### App
```
$ cd BookshelfApp/
$ carthage update --platform iOS
$ open BookshelfApp.xcodeproj
```

1. Run the server
2. Run the app
3. Add some books
 
## Dependencies 
### Server
Using [Swift Package Manager](https://github.com/apple/swift-package-manager) for dependency management.
