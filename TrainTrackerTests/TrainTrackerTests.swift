//
//  TrainTrackerTests.swift
//  TrainTrackerTests
//
//  Created by Nicholas Repaci on 7/20/21.
//

import XCTest
@testable import TrainTracker

class TrainTrackerTests: XCTestCase {
    
    var api = API()
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAPI() {
        
        // Create an expectation for a background download task.
        let expectation = XCTestExpectation(description: "Test if API is returning data. Be sure to launch server before testing.")
        
        // Create a URL for a web page to be downloaded.
        let url = URL(string: "http://127.0.0.1:5000/by-route/A")!
        
        // Create a background task to download the web page.
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            // Make sure we downloaded some data.
            XCTAssertNotNil(data, "No data was downloaded.")
            
            // Fulfill the expectation to indicate that the background task has finished successfully.
            expectation.fulfill()
            
        }
        
        // Start the download task.
        dataTask.resume()
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
