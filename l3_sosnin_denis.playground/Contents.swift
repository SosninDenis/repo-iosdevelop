// by Sosnin Denis

import Foundation

//Домашнее задание урока №3

// Задание перечислений для типов состояния двигателя, окон и багажника
enum EngineCondition { //перечисление для состояния двигателя
    case turnedOn, turnedOff
}
enum WindowsCondition { //перечисление для состояния окн
    case closed, opened
}
enum TankCodition { //состояние топливного бака
    case full, empty
}


struct SportCar { //струкрура для легкового авто
    var model: String
    var type: String
    var yearOfManufacture: Int
    var engine: EngineCondition
    var windows: WindowsCondition
    var fuelTank: TankCodition
    
    func description() {//метод вывода информации о машине
        print ("Легковая машина \(model) \(type) \(yearOfManufacture) года выпуска. Двигатель: \(engine), Окна: \(windows), Топливный бак: \(fuelTank)")
    }
    
    mutating func changeCondition (action: ActionWithCar) {// метод изменения состояния машины
        switch action {
        case .closeWindow:
            windows = .closed
        case .openWindow:
            windows = .opened
        case .refuelCar:
            fuelTank = .full
        case .turnOnEngine:
            engine = .turnedOn
        case .turnOffEngine:
            engine = .turnedOff
        default: break
        }
    }
    
}

struct TrunkCar { // структура для грузового авто
    var model: String
    var yearOfManufacture: Int
    var trunkVolume: Int
    var engine: EngineCondition
    var windows: WindowsCondition
    var trunkFree: Int
    var fuelTank: TankCodition
    
    func description() {//метод описания функции
        print ("Грузовая машина \(model) \(yearOfManufacture) года выпуска. Двигатель: \(engine), Окна: \(windows), Объем багажника: \(trunkVolume) м3, из них свободно: \(trunkFree) м3, Топливный бак: \(fuelTank)")
    }
    mutating func changeCondition (action: ActionWithCar) {
        switch action {
        case .closeWindow:
            windows = .closed
        case .openWindow:
            windows = .opened
        case .refuelCar:
            fuelTank = .full
        case .turnOnEngine:
            engine = .turnedOn
        case .turnOffEngine:
            engine = .turnedOff
        case .loadTrunk(let loadValue) where loadValue > trunkFree:
            print("Не весь груз влез в машину. Нужно ещё \(loadValue - trunkFree)")
            trunkFree = 0
        case .loadTrunk(let loadValue) where loadValue < trunkFree:
            trunkFree = trunkFree - loadValue
        case .loadTrunk(let loadValue) where loadValue == trunkFree:
            trunkFree = 0
            print("кузов машины заполнен")
        case .unloadTrunk(let unloadValue) where unloadValue <= (trunkVolume - trunkFree):
            trunkFree = trunkFree + unloadValue
        default: break
        }
    }
}


//Перечисление с возможными действиям с автомобилем
enum ActionWithCar{
    case turnOnEngine
    case turnOffEngine
    case refuelCar
    case closeWindow
    case openWindow
    case loadTrunk(valueWeight: Int)
    case unloadTrunk(valueWeight: Int)
}

//проверки работы сделанных структур и перечислений

//проверки легковых машин
var sportCar1 = SportCar(model: "Honda", type: "Accord", yearOfManufacture: 1990, engine: .turnedOn, windows: .closed, fuelTank: .empty)
sportCar1.description()
sportCar1.changeCondition(action: .turnOffEngine)
sportCar1.changeCondition(action: .refuelCar)
sportCar1.description()

var sportCar2 = SportCar(model: "AUDI", type: "A8", yearOfManufacture: 2021, engine: .turnedOn, windows: .opened, fuelTank: .full)
sportCar2.description()
sportCar2.changeCondition(action: .closeWindow)
sportCar2.description()
// проверки с грузовой машиной
var trunkCar2 = TrunkCar(model: "Камаз", yearOfManufacture: 1980, trunkVolume: 6, engine: .turnedOff, windows: .opened, trunkFree: 6, fuelTank: .empty)
trunkCar2.description()
trunkCar2.changeCondition(action: .loadTrunk(valueWeight: 3))
trunkCar2.description()
trunkCar2.changeCondition(action: .loadTrunk(valueWeight: 4))
trunkCar2.description()
trunkCar2.changeCondition(action: .refuelCar)
trunkCar2.description()




