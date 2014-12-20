//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Steven W on 12/10/14.
//  Copyright (c) 2014 Steven W. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var myAgeLabel: UILabel!
    @IBOutlet weak var myBreedLabel: UILabel!
    @IBOutlet weak var randomFactLabel: UILabel!
    
    var myTigers:[Tiger] = []
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var myTiger = Tiger()
        myTiger.name = "Tigger"
        myTiger.age = 3
        myTiger.breed = "Bengal"
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        
        myTiger.age = myTiger.ageInTigerYearsFromAge(myTiger.age)
        
        myTiger.chuff()
        myTiger.chuffANumberOfTimes(5, isLoud: false)
        
        println("My Tiger's name is: \(myTiger.name), its' age is \(myTiger.age), its' breed is \(myTiger.breed) and its' image is \(myTiger.image!)")
        
        self.myImageView.image = myTiger.image
        self.nameLabel.text = myTiger.name
        self.myAgeLabel.text = "\(myTiger.age)"
        self.myBreedLabel.text = myTiger.breed
        self.randomFactLabel.text = myTiger.randomFact()
        
        var secondTiger = Tiger()
        secondTiger.name = "Tigress"
        secondTiger.age = 2
        secondTiger.breed = "Indochinese Tiger"
        secondTiger.image = UIImage(named: "IndochineseTiger.jpg")
        
        secondTiger.age = secondTiger.ageInTigerYearsFromAge(secondTiger.age)
        
        secondTiger.chuff()
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Jacob"
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.age = 4
        thirdTiger.image = UIImage(named: "MalayanTiger.jpg")
        
        thirdTiger.age = thirdTiger.ageInTigerYearsFromAge(thirdTiger.age)
        thirdTiger.chuff()
        
        var fourthTiger = Tiger()
        fourthTiger.name = "Spar"
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.age = 5
        fourthTiger.image = UIImage(named: "SiberianTiger.jpg")
        
        fourthTiger.age = fourthTiger.ageInTigerYearsFromAge(fourthTiger.age)
        fourthTiger.chuff()
        
        // Shorthand way of writing the same code as shown above
        var fifthTiger = Tiger(age: 7, name: "Shere Kahn", breed: "Bengal", image: UIImage(named: "BengalTiger.jpg"))
        
        fifthTiger.age = fifthTiger.ageInTigerYearsFromAge(fifthTiger.age)
        fifthTiger.chuff()
        
        self.myTigers += [myTiger, secondTiger,thirdTiger,fourthTiger,fifthTiger]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func nextBarButtonPressed(sender: AnyObject) {
        
// Code to generate random but runs into the issue of repeating the same instance back to back.
//        var randomIndex:Int
//        
//        do {
//            randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
//        } while currentIndex == randomIndex
//        
//        currentIndex = randomIndex

// Shorthand code to the above code.
        
        var randomIndex = 0
        for randomIndex = currentIndex; randomIndex == self.currentIndex; randomIndex = Int(arc4random_uniform(UInt32(myTigers.count))) {}
        self.currentIndex = randomIndex
        
        let tiger = self.myTigers[randomIndex]
        
//        myImageView.image = tiger.image
//        nameLabel.text = tiger.name
//        myAgeLabel.text = "\(tiger.age)"
//        myBreedLabel.text = tiger.breed
        // Test comment - delete when you see this.
        
        // duration: how long should the duration be for the animaltion
        // UIViewAnimationOptions is the type of animations
        UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            
            self.myImageView.image = tiger.image
            self.nameLabel.text = tiger.name
            self.myBreedLabel.text = tiger.breed
            self.myAgeLabel.text = "\(tiger.age)"
            self.randomFactLabel.text = tiger.randomFact()
            
            }, completion: {
                (finished: Bool) -> () in
        })
    }
}

