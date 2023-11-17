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
}

let willEze = Tamagotchi(hunger: 10.0, happiness: 2.0, health: 3.0, age: 16.8, generation: "Eze")

