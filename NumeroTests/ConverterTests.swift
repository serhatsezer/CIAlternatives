/// Copyright (c) 2018 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.


import XCTest
@testable import Numero

class ConverterTests: XCTestCase {
  
  let converter = Converter()
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testConversionForOne() {
    let result = converter.convert(1)
    XCTAssertEqual(result, "I", "Conversion for 1 is incorrect")
  }
  
  func testConversionForTwo() {
    let result = converter.convert(2)
    XCTAssertEqual(result, "II", "Conversion for 2 is incorrect")
  }
  
  func testConversionForFive() {
    let result = converter.convert(5)
    XCTAssertEqual(result, "V", "Conversion for 5 is incorrect")
  }
  
  func testConversionForSix() {
    let result = converter.convert(6)
    XCTAssertEqual(result, "VI", "Conversion for 6 is incorrect")
  }
  
  func testConversionForTen() {
    let result = converter.convert(10)
    XCTAssertEqual(result, "X", "Conversion for 10 is incorrect")
  }
  
  func testConversionForTwenty() {
    let result = converter.convert(20)
    XCTAssertEqual(result, "XX", "Conversion for 20 is incorrect")
  }
  
  func testConversionForFour() {
    let result = converter.convert(4)
    XCTAssertEqual(result, "IV", "Conversion for 4 is incorrect")
  }
  
  func testConversionForNine() {
    let result = converter.convert(9)
    XCTAssertEqual(result, "IX", "Conversion for 9 is incorrect")
  }
  
  func testConverstionForZero() {
    let result = converter.convert(0)
    XCTAssertEqual(result, "", "Conversion for 0 is incorrect")
  }
  
  func testConverstionFor3999() {
    let result = converter.convert(3999)
    XCTAssertEqual(result, "MMMCMXCIX", "Conversion for 3999 is incorrect")
  }
    
}
