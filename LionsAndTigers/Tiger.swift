import Foundation
import UIKit

struct Tiger {
    var name = ""
    var age = 0
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
    
    func randomFact() -> String {
    let randomFactString:[String]=[
        "The Tiger is the biggest species in the cat family",
        "Tigers can reach a length of 3.3 meters",
        "A group of tigers is known as an 'ambush' or 'streak'"]
    
    let randomNumber = Int(arc4random_uniform(UInt32(randomFactString.count)))
        
    return randomFactString[randomNumber]
    }
}