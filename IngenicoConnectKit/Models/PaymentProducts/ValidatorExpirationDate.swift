//
//  ValidatorExpirationDate.swift
//  IngenicoConnectKit
//
//  Created for Ingenico ePayments on 15/12/2016.
//  Copyright © 2016 Global Collect Services. All rights reserved.
//

import Foundation

public class ValidatorExpirationDate: Validator {
    public var dateFormatter = DateFormatter()
    
    public override init() {
        dateFormatter.dateFormat = "MMyy"
    }
    
    public override func validate(value: String, for request: PaymentRequest) {
        super.validate(value: value, for: request)
        
        if let submittedDate = dateFormatter.date(from: value) {
            let today = Date()
            let result = today.compare(submittedDate)
            if result == ComparisonResult.orderedDescending {
                let error = ValidationErrorExpirationDate()
                errors.append(error)
            }
        } else {
            let error = ValidationErrorExpirationDate()
            errors.append(error)
        }
    }
}
