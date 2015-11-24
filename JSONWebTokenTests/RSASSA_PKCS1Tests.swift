//
//  JSONWebTokenTests.swift
//  JSONWebTokenTests
//
//  Created by Antoine Palazzolo on 17/11/15.
//  Copyright © 2015 Antoine Palazzolo. All rights reserved.
//

import XCTest
import JSONWebToken
import Security

class RSASSA_PKCS1Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRS256VerifySuccess() {
        let jwt = ReadSampleWithName("RS256")
        let verifier = RSASSA_PKCS1Verifier(hashFunction: .SHA256, key : SamplePublicKey)
        XCTAssertTrue(verifier.validateToken(jwt).isValid)
    }
    func testRS384VerifySuccess() {
        let jwt = ReadSampleWithName("RS384")
        let verifier = RSASSA_PKCS1Verifier(hashFunction: .SHA384, key : SamplePublicKey)
        XCTAssertTrue(verifier.validateToken(jwt).isValid)
    }
    func testRS512VerifySuccess() {
        let jwt = ReadSampleWithName("RS512")
        let verifier = RSASSA_PKCS1Verifier(hashFunction: .SHA512, key : SamplePublicKey)
        XCTAssertTrue(verifier.validateToken(jwt).isValid)
    }
    
    func testRS256VerifyFailure() {
        let jwt = ReadSampleWithName("RS256_2")
        let verifier = RSASSA_PKCS1Verifier(hashFunction: .SHA256, key : SamplePublicKey)
        XCTAssertFalse(verifier.validateToken(jwt).isValid)
    }
    func testRS384VerifyFailure() {
        let jwt = ReadSampleWithName("RS384_2")
        let verifier = RSASSA_PKCS1Verifier(hashFunction: .SHA384, key : SamplePublicKey)
        XCTAssertFalse(verifier.validateToken(jwt).isValid)
    }
    func testRS512VerifyFailure() {
        let jwt = ReadSampleWithName("RS512_2")
        let verifier = RSASSA_PKCS1Verifier(hashFunction: .SHA512, key : SamplePublicKey)
        XCTAssertFalse(verifier.validateToken(jwt).isValid)
    }
    
}