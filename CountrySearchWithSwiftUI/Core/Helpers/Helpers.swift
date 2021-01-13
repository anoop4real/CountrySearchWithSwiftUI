//
//  Helpers.swift
//  CountrySearchWithSwiftUI
//
//  Created by Anoop M on 2021-01-13.
//

import Foundation

func generalError() ->Error {
    return NSError(domain: "AppDomain", code: 999, userInfo: ["Info": "General Error / Data missing"])
}
