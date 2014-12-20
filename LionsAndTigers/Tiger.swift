//
//  Tiger.swift
//  LionsAndTigers
//
//  Created by Steven W on 12/10/14.
//  Copyright (c) 2014 Steven W. All rights reserved.
//

import Foundation
import UIKit

struct Tiger {
    var age = 0
    var name = ""
    var breed = ""
    var image = UIImage(named:"")
    
    func chuff(){
        println("\(self.name): Chuff Chuff")
    }
    
    func chuffANumberOfTiimes (numberOfTimes: Int) {
        for var chuff = 0; chuff < numberOfTimes; ++chuff {
            self.chuff()
        }
    }
    
    func chuffANumberOfTimes(numberOfTimes:Int,isLoud:Bool){
        for var chuffTimes = 1; chuffTimes <= numberOfTimes; chuffTimes++ {
            if isLoud{
                chuff()
            }
            else {
                println("\(self.name): purr purr")
            }
        }
    }
    
    func ageInTigerYearsFromAge(regularAge:Int) -> Int {
        return regularAge * 3
    }
    
//    func randomFact() -> String {
//        let randomNumber = Int(arc4random_uniform(UInt32(3)))
//        var randomFact:String
//        
//        if randomNumber == 0 {
//            randomFact = "The Tiger is the biggest species in the cat family"
//        }
//        else if randomNumber == 1 {
//            randomFact = "Tiges can reach a length of 3.3 meters"
//        }
//        else {
//            randomFact = "A group of tigers is known as an 'ambush' or 'streak'"
//        }
//        return randomFact
//    }
    
    func randomFact() -> String {
    let randomFactString:[String]=[
        "The Tiger is the biggest species in the cat family",
        "Tigers can reach a length of 3.3 meters",
        "A group of tigers is known as an 'ambush' or 'streak'"]
    
    let randomNumber = Int(arc4random_uniform(UInt32(randomFactString.count)))
        
    return randomFactString[randomNumber]
    }
}