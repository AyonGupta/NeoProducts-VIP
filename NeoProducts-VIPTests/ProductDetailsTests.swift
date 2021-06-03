//
//  ProductDetailsTests.swift
//  NeoProducts-VIPTests
//
//  Created by webwerks on 03/06/21.
//

import XCTest
class ProductDetailsTests: XCTestCase {
    var expectation: XCTestExpectation?
    lazy var interactor: ProductDetailsViewInteractor = {
        
        let presenter = ProductDetailsViewPresenter()
        let interactor = ProductDetailsViewInteractor(presenter: presenter,
                                                      productService: ProductService(networkManager: NetworkManager.shared), connectivity: ConnectivityService(), product_id: 1)
        
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
     * Parameters: products
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
extension ProductDetailsTests : IProductDetailsPresenterOutput {
    /*
     * Method name: presenter didRetrieveProductDetaails
     * Description: use to call presenter function once product data found
     * Parameters: productsDetails
     * Return:  -
     */
    func presenter(didRetrieveProducts productsDetails: ProductDetails) {
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
}
