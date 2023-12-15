//
//  main.swift
//  Practice
//
//  Created by Hyori Choi on 10/21/23.
//

import Foundation

var num: Int = Int(readLine()!)!
var Integer: [Int] = []

for _ in 1...num{
    Integer = (readLine()!.split(separator: " ")).map{ Int($0)! }
    print(Integer[0] + Integer[1])
}
