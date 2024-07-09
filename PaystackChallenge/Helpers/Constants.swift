//
//  Constants.swift
//  PaystackChallenge
//
//  Created by Masud Onikeku on 03/07/2024.
//

import Foundation
import UIKit

let url = "https://api.github.com/search/repositories?q="
let appendage = "&page=1&per_page=50"

let navyBlue = UIColor(hex: "#2F466C")
let yvTextbg = UIColor(red: 241/255, green: 241/255, blue: 247/255, alpha: 0.8)
let valuebg = UIColor(red: 130/255, green: 130/255, blue: 130/255, alpha: 1.0)

let dummyRepo = [APIRepo(id: 1, name: "Dev", description: "Paystack Dev", url: "www.paystack.com", owner: Owner(login: "Dev", id: 1, avatar: "www.paystack.jpg"))]
