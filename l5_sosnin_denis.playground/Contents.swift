// by Sosnin Denis

import Foundation

//Домашнее задание урока №5 "Продолжение ООП"

// MARK: Перечисления с переменными

    enum Engine {
        case turnOnEngine
        case turnOffEngine
    }
    enum RefuelCar{
        case refuelCar
    }
    enum Windows {
        case closeWindow
        case openWindow
    }

    enum EngineCondition: String { //перечисление для состояния двигателя
        case turnedOn = "включен"
        case turnedOff = "выключен"
    }

    enum WindowsCondition: String { //перечисление для состояния окн
        case closed = "закрыты"
        case opened = "открыты"
    }

    enum TankCodition: String { //состояние топливного бака
        case full = "полный"
        case empty = "пустой"
    }

// 1. Создать протокол "Car" и описать свойства, общие для автомобилей, а также метод действия
protocol Car {
    var brand: String { get }
    var yearOfManufacture: Int { get }
    var engine: EngineCondition { get set }
    var windows: WindowsCondition { get set }
    var fuelTank: TankCodition { get set }

    func changeCondition ()
}

// 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).

//Добавление метода открытия/закрытия окн
extension Car {
    mutating func changeConditionWindows(action: Windows) -> () {
        switch action {
        case .closeWindow:
            windows = .closed
        case .openWindow:
            windows = .opened
        }
    }
}

//Добавление метода включения/выключения дивагателя
extension Car {
    mutating func changeConditionEngine(action: Engine) -> () {
        switch action {
        case .turnOnEngine:
                engine = .turnedOn
        case .turnOffEngine:
                engine = .turnedOff
        }
    }
}

//Добавление метода заправки машины
extension Car {
    mutating func Refuel(action: RefuelCar) -> () {
            switch action {
            case .refuelCar:
                fuelTank = .full
        }
    }
}
    
// 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.

//создаем класс "SportCar"
class SportCar: Car {
    var brand: String
    var yearOfManufacture: Int
    var engine: EngineCondition
    var windows: WindowsCondition
    var fuelTank: TankCodition
    var model: String
    var maxSpeed: Int

    init(brand: String, yearOfManufacture: Int, engine: EngineCondition, windows: WindowsCondition, fuelTank: TankCodition, model: String, maxSpeed: Int) {
        self.brand = brand
        self.yearOfManufacture = yearOfManufacture
        self.windows = windows
        self.engine = engine
        self.fuelTank = fuelTank
        self.model = model
        self.maxSpeed = maxSpeed
    }
    func changeCondition() {
    }
}

//создаем класс "TrunkCar"
class TrunkCar: Car {
    var brand: String
    var yearOfManufacture: Int
    var engine: EngineCondition
    var windows: WindowsCondition
    var fuelTank: TankCodition
    var trunkVolume: Int

    init (brand: String, yearOfManufacture: Int, engine: EngineCondition, windows: WindowsCondition, fuelTank: TankCodition, trunkVolume: Int) {
        self.trunkVolume = trunkVolume
        self.brand = brand
        self.yearOfManufacture = yearOfManufacture
        self.windows = windows
        self.engine = engine
        self.fuelTank = fuelTank
    }
    
    func changeCondition() {
    }
}
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.

//Расширение для класса sportCar
extension SportCar: CustomStringConvertible {
    var description: String {
        return "\u{1F697} \(brand) \(model) \(yearOfManufacture) года выпуска. Максимальная скорость: \(maxSpeed) км/ч. Двигатель: \(engine.rawValue). Окна: \(windows.rawValue). Топливный бак: \(fuelTank.rawValue)"
    }
}

//Расширение для класса trunkCar
extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "\u{1F69A} \(brand) \(yearOfManufacture) года выпуска. Двигатель: \(engine.rawValue). Окна: \(windows.rawValue). Топливный бак: \(fuelTank.rawValue). Кузов размера \(trunkVolume) м3"
    }
}

//5. Создать объекты и выполнить действия с ними

var sportcar1 = SportCar(brand: "Hodna", yearOfManufacture: 2000, engine: .turnedOff, windows: .closed, fuelTank: .empty, model: "S2000", maxSpeed: 325)
sportcar1.maxSpeed = 425
sportcar1.changeConditionEngine(action: .turnOnEngine)
sportcar1.Refuel(action: .refuelCar)


var trunkCar1 = TrunkCar(brand: "ЗИЛ", yearOfManufacture: 1980, engine: .turnedOff, windows: .opened, fuelTank: .full, trunkVolume: 5)
trunkCar1.trunkVolume = 6
trunkCar1.changeConditionWindows(action: .closeWindow)
trunkCar1.brand = "MAN"

