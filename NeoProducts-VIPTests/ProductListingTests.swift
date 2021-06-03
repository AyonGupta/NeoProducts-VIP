//
//  ProductListingTests.swift
//  NeoProducts-VIPTests
//
//  Created by webwerks on 03/06/21.
//

import XCTest

class ProductListingTests: XCTestCase {
    var expectation: XCTestExpectation?
    lazy var interactor: ProductListViewInteractor = {
        let presenter = ProductListViewPresenter()
        let networkService = ProductService(networkManager: NetworkManager.shared)
        let dataService = FavoriteService()
        let connectionService = ConnectivityService()
        let interactor = ProductListViewInteractor(presenter: presenter,
                                                   productService: networkService,
                                                   connectivity: connectionService,
                                                   favoriteService: dataService)
        presenter.viewController = self
        return interactor
    }()
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    /*
     * Method name: testAPICall didRetrieveProducts
     * Description: This function use test api call on success it will return data via protocols
     * Parameters:
     * Return:  -
     */
    func testAPICall() {
        expectation = self.expectation(description: #function)
        interactor.initSetup()
        waitForExpectations(timeout: 5.0)
    }
    
    private func satisfyText(success:Bool) {
        XCTAssertTrue(success)
        if let expectation = self.expectation {
            expectation.fulfill()
        }
    }
}
extension ProductListingTests: IProductListPresenterOutput {
    
    /*
     * Method name: presenter didRetrieveProducts
     * Description: This function use to nofity once product downloaded, class calling relaod tableView function
     * Parameters: products
     * Return:  -
     */
    func presenter(didRetrieveProducts products: [Product]) {
        satisfyText(success: true)
    }
    
    /*
     * Method name: presenter internetConnectionRequired
     * Description: use to show alert if network not found
     * Parameters: error
     * Return:  -
     */
    func presenter(internetConnectionRequired error: String) {
        satisfyText(success: false)
    }
    
    /*
     * Method name: presenter didFailedRetrieveProducts
     * Description: use to call updatePlaceholderText function if error found
     * Parameters: error
     * Return:  -
     */
    func presenter(didFailedRetrieveProducts error: String) {
        satisfyText(success: false)
    }
    
    /*
     * Method name: presenter didRetriveFavouriteProducts
     * Description: use to call presenter function when Favorites found
     * Parameters: error
     * Return:  -
     */
    func presenter(didRetriveFavouriteProducts products: [FavouriteProduct]) {
    }
    
    /*
     * Method name: presenter didAddFavouriteProducts
     * Description: use to call when product added to Favorites
     * Parameters: error
     * Return:  -
     */
    func presenter(didAddFavouriteProducts product: FavouriteProduct) {
    }
    
    /*
     * Method name: presenter didFailToAddFavouriteProduct
     * Description: use to call when product error occured while adding to Favorites
     * Parameters: error
     * Return:  -
     */
    func presenter(didFailToAddFavouriteProduct error:String) {
    }
    
    /*
     * Method name: presenter didRemoveFavouriteProducts
     * Description: use to call when product removed from Favorites
     * Parameters: error
     * Return:  -
     */
    func presenter(didRemoveFavouriteProducts index: Int) {
    }
    
    /*
     * Method name: presenter didFailToRemoveFavouriteProduct
     * Description: use to call when error occured while removing from Favorites
     * Parameters: error
     * Return:  -
     */
    func presenter(didFailToRemoveFavouriteProduct error:String) {
    }
}
