//
//  tamogotchi.swift
//  Tamagotchi Console App
//
//  Created by Kwong, Andreas (IRG) on 17/11/2023.
//

import Foundation

class Tamagotchi {
    private var hunger: Double
    private var happiness: Double
    private var health: Double
    private var age: Double
    private var generation: String
    init(hunger: Double, happiness: Double, health: Double, age: Double, generation: String) {
        self.hunger = hunger
        self.happiness = happiness
        self.health = health
        self.age = age
        self.generation = generation
    }
    func getHunger() -> Double {
        return self.hunger
    }
    func getHappiness() -> Double {
        return self.happiness
    }
    func getHealth() -> Double {
        return self.health
    }
    func getAge() -> Double {
        return self.age
    }
    func getGeneration() -> String {
        return self.generation
    }
    func feed() -> String {
        let tempHunger = self.getHunger()
        self.hunger = self.getHunger() + 2.5
        return "Your Tamagotchi has been fed. (Hunger Level: \(tempHunger) -> \(String(self.hunger)))"
    }
    func play() -> String {
        let tempHappiness = self.getHappiness()
        print("1. Play with Tamagotchi")
        print("2. Entertain Tamagotchi")
        print("3. Let Tamagotchi Sleep")
        if let input = readLine() {
            if Int(input) == 1 {
                self.happiness = self.getHappiness() + 2.5
                return "Your Tamagotchi has been played with. (Happiness Level: \(tempHappiness) -> \(String(self.happiness)))"
            }
            else if Int(input) == 2 {
                self.happiness = self.getHappiness() + 2.5
                return "Your Tamagotchi has been entertained. (Happiness Level: \(tempHappiness) -> \(String(self.happiness)))"
            }
            else if Int(input) == 3 {
                print("Turn the lights off so your Tamagotchi can sleep")
                print("(Input: Lights Off)")
                if let input = readLine() {
                    if input == "Lights Off" {
                        self.happiness = self.getHappiness() + 2.5
                        return "Your Tamagotchi is now sleeping soundly. (Happiness Level: \(tempHappiness) -> \(String(self.happiness)))"
                    }
                    else {
                        self.happiness = self.getHappiness() + 1
                        return "Your Tamagotchi is now sleeping not so soundly (Lights are still on...). (Happiness Level: \(tempHappiness) -> \(String(self.happiness)))"
                    }
                }
            }
        }
        let tempAge = self.getAge()
        self.happiness = self.getHappiness() - 1.0
        self.age = self.getAge() + 0.5
        return "Your Tamagotchi isn't feeling happier and has even aged because of the stress. (Happiness Level: \(tempHappiness) -> \(String(self.happiness)), Age: \(tempAge) -> \(String(self.age)))"
    }
    func wake() -> String {
        let tempAge = self.getAge()
        print("Wake up your Tamagotchi by inputting (Wake Up)")
        if let input = readLine() {
            if input == "Wake Up" {
                self.age = self.getAge() + 1.0
                return "Your Tamagotchi has now woken up. (Age: \(tempAge) -> \(String(self.age)))"

            }
        }
        return "Your Tamagotchi hasn't woken up well..."
    }
    func relieve() -> String {
        let tempHappiness = self.getHappiness()
        print("Relieve your Tamagotchi by inputting (Relieve)")
        if let input = readLine() {
            if input == "Relieve" {
                self.happiness = self.getHappiness() + 0.5
                return "Your Tamagotchi is feeling much more comfortable now. (Happiness Level: \(tempHappiness) -> \(String(self.happiness)))"
            }
        }
        return "Your Tamagotchi has not been properly relieved..."
    }
    func unsick() -> String {
        let tempHealth = self.getHealth()
        print("Input Unsick to heal your Tamagotchi")
        if let input = readLine() {
            if input == "Unsick" {
                return "Your Tamagotchi has now been healed (Health Level: \(String(self.health)))"
            }
        }
        self.health = self.getHealth() - 2.0
        return "Your Tamagotchi has not been healed (Health Level: \(tempHealth) -> \(String(self.health)))"
    }
    func grow() -> String {
        let tempAge = self.getAge()
        self.age = self.getAge() + 1.0
        return "Your Tamagotchi has aged 1 year (Age: \(tempAge) -> \(String(self.age)))"
    }
    func chores() {
        var chores = ["[Your Tamagotchi is feeling a little depressed]", "[Your Tamagotchi is feeling a little hungry]", "[Your Tamagotchi is feeling a little tired]", "[Your Tamagotchi needs to go to the restroom]", "[Your Tamagotchi is feeling bored]", "[Your Tamagotchi is feeling a little ill]", "[Your Tamagotchi feels it is time to grow]"]
        chores.shuffle()
        print(chores[0])
    }
    func actions() {
        print("Actions Available: ")
        print("     1. Feed")
        print("     2. Play")
        print("     3. Wake")
        print("     4. Relieve")
        print("     5. Unsick")
        print("     6. Grow")
    }
    func startingMenu() {
        print("All Tamagotchis will start at 10.0 for Hunger, Happiness, Health and 0.0 for Age")
        print("Pick your generation name: ")
        if let input = readLine() {
            let character = Tamagotchi(hunger: 10.0, happiness: 10.0, health: 10.0, age: 0.0, generation: String(input))
            var death = false
            while death != true {
                character.actions()
                character.chores()
                if let input = readLine() {
                    if Int(input) == 1 {
                        print(character.feed())
                    }
                    else if Int(input) == 2 {
                        print(character.play())
                    }
                    else if Int(input) == 3 {
                        print(character.wake())
                    }
                    else if Int(input) == 4 {
                        print(character.relieve())
                    }
                    else if Int(input) == 5 {
                        print(character.unsick())
                    }
                    else if Int(input) == 6 {
                        print(character.grow())
                    }
                }
                if character.getAge() >= 5.0 {
                    print("Your Tamagotchi has died from old age")
                    death = true
                }
                if character.getHealth() <= 3.0 {
                    print("Your Tamagotchi has died from an illness")
                    death = true
                }
                if character.getHunger() <= 3.0 {
                    print("Your Tamagotchi has died from starvation")
                    death = true
                }
                if character.getHappiness() <= 3.0 {
                    print("Your Tamagotchi has died from depression")
                    death = true
                }
            }
        }
    }
}


