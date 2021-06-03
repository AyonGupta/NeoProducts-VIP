# NeoProductsApp

A simple iOS product listing application demonstrate the usage of VIP Clean architecture using Live data(API Call), Offline data(Core data), View-Data binding, Alamofire, SDWebImage, Cocoa Pod, Dependancy Injections, Unit Testing based on Clean architecture. The application supporting Core data for offline data storage for favorites Products.

# About VIP Clean Architecture 

Clean Architecture segregate the app into multiple layers, each layer having own role. VIP work with Unidirectional approach of Controller -> Interactor -> Presenter —> Controller

Communication of each layer done via Protocols, each layer having own protocol and using this they are passing/receiving data between layers.

# View:
Its subclass of UIView, we can refer it for own controller view

# ViewController:
Use to manage all things of view, Communicate with Controller for getting data from different sources and receive data from   Presenter
   
# Interactor: 
Perform all business logic things with help of dependancy services ie Network, database etc. Once data retrieve from business it will send to  Presenter.
        
# Presenter:
The main Role of Presenter is to get data from Interactor and transfer data to ViewController

# Models
Use to store data related to controller, its Codatable object or Core data entity

# Router: 
Use to perform navigation functionality inside the app, it taking help of Configurator class to get all things of target class
    
# Configurator:
Responsible for All configuration which required to router linking 

# Neo Product App Layers:

    # Application Layer:  Containing AppDelegate file
    # Presentation Layer: Containing all modules and its implementation
    # Business Layer:  Containing all business logic services and enitiy file
    # Core Layer:  Containing core communication which is require for business layer
    # Utility Layer:  Containing all uitls, constacts and reusable files.
    # Resource Layer:  Containing all resource files



# Ref Links 
 https://medium.com/@mlukacs_42903/part-1-what-is-clean-swift-vip-a-brief-overview-a43d4d66e664
 https://betterprogramming.pub/implement-a-clean-vip-architecture-in-swift-5-e1a27c7c92a7

