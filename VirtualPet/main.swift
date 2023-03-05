//
//  main.swift
//  VirtualPet
//
//  Created by Madison Mitchell on 3/4/23.
//

import Foundation

print("Welcome to Virtual Pet!")
print("What would you like to name your pet?")
var petName: String = readLine()!

var pet = VirtualPet(name: petName)

print("\n\(pet.name) loves you already! *wag wag wag*")

while pet.isAlive {
    mainMenu()
    var userChoice: Int = 0
    userChoice = userInput()
    
    if userChoice == 1 {
        pet.feed()
        print("\n*nom nom nom...")
    }
    if userChoice == 2 {
        pet.water()
        print("\n*slurp slurpp sluuurpppp!")
    }
    if userChoice == 3 {
        print("\nWhat would you like to play?")
        print("1.\tFrisbee")
        print("2.\tCards")
        
        userChoice = userInput()
        
        if userChoice == 1 {
            pet.play(activity: 1)
            print("\(pet.name) is feeling \(pet.mood.lowercased())!")
        } else if userChoice == 2 {
            pet.play(activity: 2)
            print("\(pet.name) is rather... \(pet.mood).)")
        }
        
    }
    pet.tick()
}

print("Oh no! \(pet.name) fainted!")
print("\nThank you for playing Virtual Pet!\n\n\n")


func mainMenu() {
    print("_____________________________________________________________")
    print("| Health\t| Hunger\t| Thirst\t| Energy\t| Mood\t\t|")
    print("| \(pet.health)\t\t| \(pet.hunger)\t\t| \(pet.thirst)\t\t| \(pet.energy)\t\t| \(pet.mood)\t\t|")
    print("_____________________________________________________________")

    print("\nHow would you like to interact with \(pet.name)?")
    print("1.\tFeed")
    print("2.\tWater")
    print("3.\tPlay")
}

func userInput() -> Int {
    var userChoice: Int = 0
    
    while true {
        if let input = readLine(), let choice = Int(input){
            userChoice = choice
            return userChoice
            break
        } else {
            print("Please enter a number corresponding to your choice of how to interact with \(pet.name).")
        }
    }
}
