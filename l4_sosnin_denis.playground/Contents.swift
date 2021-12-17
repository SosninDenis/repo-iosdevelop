// by Sosnin Denis

import Foundation

//Домашнее задание урока №4 "Классы"


class Car { // создание Родительского класса (суперкласса)
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
    // Задание перечислений для типов состояния двигателя, окон и топливного бака
    enum EngineCondition: String { //перечисление для состояния двигателя
        case turnedOn = "выключен"
        case turnedOff = "включен"
    }
    enum WindowsCondition: String { //перечисление для состояния окн
        case closed = "закрыты"
        case opened = "открыты"
    }
    enum TankCodition: String { //состояние топливного бака
        case full = "полный"
        case empty = "пустой"
    }
    
    var brand: String
    var yearOfManufacture: Int
    var engine: EngineCondition
    var windows: WindowsCondition
    var fuelTank: TankCodition
    
    init(brand: String, yearOfManufacture: Int, engine: EngineCondition, windows: WindowsCondition, fuelTank: TankCodition) {
        self.brand = brand
        self.yearOfManufacture = yearOfManufacture
        self.windows = windows
        self.engine = engine
        self.fuelTank = fuelTank

    }
    func description() {//метод вывода информации о машине
        print ("\(brand) \(yearOfManufacture) года выпуска. Двигатель: \(engine.rawValue), Окна: \(windows.rawValue), Топливный бак: \(fuelTank.rawValue)")
    }
    func changeCondition (action: ActionWithCar) {// метод изменения состояния машины
        switch action {
        case .closeWindow:
            self.windows = .closed
        case .openWindow:
            self.windows = .opened
        case .refuelCar:
            self.fuelTank = .full
        case .turnOnEngine:
            self.engine = .turnedOn
        case .turnOffEngine:
            self.engine = .turnedOff
        case .loadTrunk(_):
            print("Для легковой машины в этом задании мы не загружаем багажник =)")
        case . unloadTrunk(_):
            print("Для легковой машины в этом задании мы не разгружаем багажник =)")
        }
    }
}
//созадем дочерний класс "Легковые машины"
class sportCar: Car {
    
    var model: String
    var maxSpeed: Int
    
    init(brand: String, yearOfManufacture: Int, engine: EngineCondition, windows: WindowsCondition, fuelTank: TankCodition, model: String, maxSpeed: Int) {
        self.model = model
        self.maxSpeed = maxSpeed
        super.init(brand: brand, yearOfManufacture: yearOfManufacture, engine: engine, windows: windows, fuelTank: fuelTank)
    }
    
    override func description() {
        print ("\(brand) \(model) \(yearOfManufacture) года выпуска. Максимальная скорость: \(maxSpeed) км/ч, Двигатель: \(engine.rawValue), Окна: \(windows.rawValue), Топливный бак: \(fuelTank.rawValue)")
    }

}
// Создаем дочерний класс "Грузовыые машины"
class TrunkCar: Car {
    var trunkVolume: Int
    var trunkFree: Int
    
    init (brand: String, yearOfManufacture: Int, engine: EngineCondition, windows: WindowsCondition, fuelTank: TankCodition, trunkVolume: Int, trunkFree: Int) {
        self.trunkVolume = trunkVolume
        self.trunkFree = trunkFree
        super.init(brand: brand, yearOfManufacture: yearOfManufacture, engine: engine, windows: windows, fuelTank: fuelTank)
    }
    
    override func description() {
        print ("\(brand) \(yearOfManufacture) года выпуска. Двигатель: \(engine.rawValue), Окна: \(windows.rawValue), Топливный бак: \(fuelTank.rawValue),  в багажнике (кузове) свободно: \(trunkFree) из \(trunkVolume) м3")
    }
               
    override func changeCondition(action: ActionWithCar) {
            switch action {
            case .closeWindow:
                self.windows = .closed
            case .openWindow:
                self.windows = .opened
            case .refuelCar:
                self.fuelTank = .full
            case .turnOnEngine:
                self.engine = .turnedOn
            case .turnOffEngine:
                self.engine = .turnedOff
            case .loadTrunk(let loadValue) where loadValue > self.trunkFree:
                print("загрузили \(self.trunkFree) м3")
                print("Не весь груз влез в машину. Нужно ещё \(loadValue - self.trunkFree) м3")
                self.trunkFree = 0
            case .loadTrunk(let loadValue) where loadValue < self.trunkFree:
                print("загрузили \(loadValue) м3")
                self.trunkFree = self.trunkFree - loadValue
            case .loadTrunk(let loadValue) where loadValue == self.trunkFree:
                print("загрузили \(loadValue) м3")
                self.trunkFree = 0
                print("кузов машины заполнен")
            case .unloadTrunk(let unloadValue) where unloadValue <= (self.trunkVolume - self.trunkFree):
                self.trunkFree = self.trunkFree + unloadValue
            default: break
            }
        }
}



//проверки работы суперклассов и классов

var car1 = Car(brand: "Камаз", yearOfManufacture: 1980, engine: .turnedOn, windows: .opened, fuelTank: .full)
car1.description()
car1.changeCondition(action: .closeWindow)

var car2 =  sportCar(brand: "Hodna", yearOfManufacture: 2000, engine: .turnedOn, windows: .closed, fuelTank: .empty, model: "S2000", maxSpeed: 250)
car2.description()
car2.changeCondition(action: .turnOffEngine)
car2.changeCondition(action: .refuelCar)
car2.maxSpeed = 300
car2.description()
car2.changeCondition(action: .loadTrunk(valueWeight: 10))

var car3 = TrunkCar(brand: "MAN", yearOfManufacture: 2020, engine: .turnedOff, windows: .closed, fuelTank: .empty, trunkVolume: 50, trunkFree: 30)
car3.description()
car3.changeCondition(action: .loadTrunk(valueWeight: 50))
car3.description()
car3.changeCondition(action: .unloadTrunk(valueWeight: 10))
car3.description()
car3.trunkVolume = 70
car3.description()


