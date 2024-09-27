//
//  ProfileViewModel.swift
//  App535
//
//  Created by IGOR on 23/09/2024.
//

import SwiftUI
import CoreData

final class ProfileViewModel: ObservableObject {

    @AppStorage("name") var name: String = ""
    @AppStorage("photo") var photo: String = ""

    @Published var addName: String = ""
    @Published var currentPhoto: String = ""

    @Published var Photos: [String] = ["Albert"]

    @Published var addTypes: [String] = ["Top up", "Withdraw"]
    @Published var currentAddType: String = ""
    
    @Published var Colors: [String] = ["green", "purple", "red", "blue", "prim", "yellow"]
    @Published var currentColor: String = "purple"

    @Published var Icons: [String] = ["star", "home", "lamp", "hlamp", "seater", "play", "heart", "medical", "gira", "joystick", "camera", "cat", "clock", "fground", "car", "mountians", "sun", "earth", "card", "dollar", "phone", "bag", "korz"]
    @Published var currentIcon: String = "star"
    
    @AppStorage("isProfileReady") var isProfileReady: Bool = false
    @AppStorage("isGoalReady") var isGoalReady: Bool = false

    @Published var isAdd: Bool = false
    @Published var isSeeAll: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isCateg: Bool = false
    @Published var isEdit: Bool = false
    @Published var isSettings: Bool = false
    @Published var isProfile: Bool = false
    
    @Published var sumGoal: String = ""

    @Published var gName: String = ""
    @Published var gGoal: String = ""
    @Published var gNewBalance: String = ""
    @Published var gSBalance: String = ""
    @Published var gColor: String = ""
    @Published var gIcon: String = ""

    @Published var goals: [PiggyModel] = []
    @Published var selectedGoal: PiggyModel?

    func addGoal() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "PiggyModel", into: context) as! PiggyModel

        loan.gName = gName
        loan.gGoal = gGoal
        loan.gNewBalance = gNewBalance
        loan.gSBalance = gSBalance
        loan.gColor = gColor
        loan.gIcon = gIcon

        CoreDataStack.shared.saveContext()
    }

    func fetchGoalss() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PiggyModel>(entityName: "PiggyModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.goals = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.goals = []
        }
    }
    
    @Published var opDate: Date = Date()
    @Published var opTime: Date = Date()
    @Published var opSum: String = ""
    @Published var opGoal: String = ""
    @Published var opType: String = ""

    @Published var operations: [OperModel] = []
    @Published var selectedOper: OperModel?

    func addOper() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "OperModel", into: context) as! OperModel

        loan.opDate = opDate
        loan.opTime = opTime
        loan.opSum = Int16(Int(opSum) ?? 0)
        loan.opGoal = opGoal
        loan.opType = opType

        CoreDataStack.shared.saveContext()
    }

    func fetchOper() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<OperModel>(entityName: "OperModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.operations = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.operations = []
        }
    }

}

