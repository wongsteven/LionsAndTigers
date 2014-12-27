import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var myAgeLabel: UILabel!
    @IBOutlet weak var myBreedLabel: UILabel!
    @IBOutlet weak var randomFactLabel: UILabel!
    
    var myTigers:[Tiger] = []
    var myLions:[Lion] = []
    
// sets the default value of the "currentAnimal" to be a "Tiger" with the index at 0
    var currentAnimal = (species: "Tiger", index: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
// sets values for the "myTiger" instance
        var firstTiger = Tiger(name: "Tigger",age: 3,breed: "Bengal",image: UIImage(named: "BengalTiger.jpg"))
        
// functions used from the Tiger struct
        firstTiger.age = firstTiger.ageInTigerYearsFromAge(firstTiger.age)
        firstTiger.chuff()
        firstTiger.chuffANumberOfTimes(5, isLoud: false)
        
// displays the information on the initial page
        self.myImageView.image = firstTiger.image
        self.nameLabel.text = firstTiger.name
        self.myAgeLabel.text = "\(firstTiger.age)"
        self.myBreedLabel.text = firstTiger.breed
        self.randomFactLabel.text = firstTiger.randomFact()
        
// creation of other myTigers[array]
        var secondTiger = Tiger(name: "Tigress",age: 2,breed: "Indochinese Tiger",image: UIImage(named: "IndochineseTiger.jpg"))
        secondTiger.age = secondTiger.ageInTigerYearsFromAge(secondTiger.age)
        secondTiger.chuff()
        
        var thirdTiger = Tiger(name:"Jacob",age:4,breed:"Malayan Tiger",image:UIImage(named: "MalayanTiger.jpg"))
        thirdTiger.age = thirdTiger.ageInTigerYearsFromAge(thirdTiger.age)
        thirdTiger.chuff()
        
        var fourthTiger = Tiger(name: "Spar",age: 5,breed: "Siberian Tiger",image: UIImage(named: "SiberianTiger.jpg"))
        thirdTiger.age = fourthTiger.ageInTigerYearsFromAge(fourthTiger.age)
        fourthTiger.chuff()
        
        var fifthTiger = Tiger(name: "Shere Kahn", age: 7, breed: "Bengal", image: UIImage(named: "BengalTiger.jpg"))
        fifthTiger.age = fifthTiger.ageInTigerYearsFromAge(fifthTiger.age)
        fifthTiger.chuff()

// Adds all the tiger instances into the array "myTigers"
        self.myTigers += [firstTiger, secondTiger,thirdTiger,fourthTiger,fifthTiger]
        
// Sets values for the "lion" instance
        var lion = Lion()
        lion.age = 4
        lion.isAlphaMale = false
        lion.image = UIImage(named: "Lion.jpg")
        lion.name = "Mufasa"
        lion.subSpecies = "West African"
        
        var lioness = Lion()
        lioness.age = 3
        lioness.isAlphaMale = false
        lioness.image = UIImage(named: "Lioness.jpeg")
        lioness.name = "Sarabi"
        lioness.subSpecies = "Barbary"
        
// Functions used from the "lion" class
        lion.roar()
        lioness.roar()
        
// Adds all the tiger instances into the array "lions"
        self.myLions += [lion,lioness]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func nextBarButtonPressed(sender: AnyObject) {
// Calls the helper functions listed below
        updateAnimal()
        updateView()
    }
    
// helpfer function switches between the "Tiger" and "Lion" arrays.
    func updateAnimal(){
        switch currentAnimal{
        case ("Tiger",_):
            var randomIndex = Int(arc4random_uniform(UInt32(myLions.count)))
            currentAnimal = ("Lion",randomIndex)
        default:
            var randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
            currentAnimal = ("Tiger",randomIndex)
        }
    }
    
// helper function updates the image view
    func updateView(){
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            
            if self.currentAnimal.species == "Tiger" {
                let tiger = self.myTigers[self.currentAnimal.index]
                self.myImageView.image = tiger.image
                self.nameLabel.text = tiger.name
                self.myAgeLabel.text = "\(tiger.age)"
                self.myBreedLabel.text = tiger.breed
                self.randomFactLabel.text = tiger.randomFact()
            } else if self.currentAnimal.species == "Lion" {
                let lion = self.myLions[self.currentAnimal.index]
                self.myImageView.image = lion.image
                self.nameLabel.text = lion.name
                self.myAgeLabel.text = "\(lion.age)"
                self.myBreedLabel.text = lion.subSpecies
                self.randomFactLabel.text = lion.randomFact()
            }
            
            self.randomFactLabel.hidden = false
            
            }, completion: {
                (finished: Bool) -> () in
        })
    }
}
