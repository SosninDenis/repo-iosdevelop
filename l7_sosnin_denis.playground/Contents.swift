// by Sosnin Denis

import Foundation

//Домашнее задание урока №7 "Управление ошибками в приложениях"


enum ActionWithCar {
    case refuelCar
    case loadTrunk(valueWeight: Int)
    case unloadTrunk(valueWeight: Int)
}

enum TankCodition: String { //состояние топливного бака
    case full = "полный"
    case empty = "пустой"
}

//Перечисление возможных ошибок
enum TrunkCarError: Error {
    case overloaded
    case toBigVolume
    case gasolineIisFull
}


protocol Car {
    var fuelTank: TankCodition { get set }
    var trunkVolume: Int { get }
    var trunkFree: Int { get set }
    func changeConditionWithIF(action: ActionWithCar)
    func changeConditionWithCatch(action: ActionWithCar) throws
}


// Создаем класс
class TrunkCar<T, U>: Car, CustomStringConvertible {
    var brand: T
    var yearOfManufacture: U
    var fuelTank: TankCodition
    var trunkVolume: Int
    var trunkFree: Int
    var description: String {
        return "\u{1F69A} \(brand) \(yearOfManufacture) года выпуска. Топливный бак: \(fuelTank.rawValue). Кузов заполнен \(trunkVolume - trunkFree) \(trunkVolume) м3"
    }
    // Инициализатор для класса
    init(brand: T, yearOfManufacture: U, fuelTank: TankCodition , trunkVolume: Int, trunkFree: Int) {
        self.brand = brand
        self.yearOfManufacture = yearOfManufacture
        self.fuelTank = fuelTank
        self.trunkVolume = trunkVolume
        self.trunkFree = trunkFree
    }
    // Добавляем методы для функции


    //Метод с устранением ошибок с помощью if
    func changeConditionWithIF(action: ActionWithCar){
        switch action {
        case .refuelCar:
            if (self.fuelTank != .full) {
                self.fuelTank = .full
                print("Бак стал полным")
            } else {
                print("Ошибка - запрявлять не нужно, бак и так полный")
            }
        case .loadTrunk(let loadValue):
            if (loadValue <= self.trunkFree) {
                self.trunkFree = self.trunkFree - loadValue
                if (self.trunkFree == 0){
                    print("Все погружено. Кузов заполнен")
                } else {
                    print("Все загружено, в кузове осталось \(self.trunkFree) м3")
                }
            } else {
                    print("Ошибка - груз слишком велик, попробуйте загрузить поменьше")
            }
        case .unloadTrunk(let unloadValue):
            if (unloadValue <= self.trunkVolume - self.trunkFree) {
                self.trunkFree = self.trunkFree + unloadValue
                print("Выгружено \(unloadValue) м3. В машине осталось \(self.trunkVolume - self.trunkFree) м3 груза")
            } else {
                print("Ошибка - в кузове нет столько груза. В машине \(self.trunkVolume - self.trunkFree) м3 груза. Введите корректные значения")
            }
        }
    }
    
    //Метод с выбрасывание ошибки
    func changeConditionWithCatch(action: ActionWithCar) throws {
        switch action {
        case .refuelCar:
            if (self.fuelTank != .full) {
                self.fuelTank = .full
                print("Бак стал полным")
            } else {
                throw TrunkCarError.gasolineIisFull
            }
        case .loadTrunk(let loadValue):
            if (loadValue <= self.trunkFree) {
                self.trunkFree = self.trunkFree - loadValue
                if (self.trunkFree == 0){
                    print("Все погружено. Кузов заполнен")
                } else {
                print("Все загружено, в кузове осталось \(self.trunkFree) м3")
                }
            } else {
                throw TrunkCarError.overloaded
            }
        case .unloadTrunk(let unloadValue):
            if (unloadValue <= self.trunkVolume - self.trunkFree) {
                self.trunkFree = self.trunkFree + unloadValue
                print("Выгружено \(unloadValue) м3. В машине осталось \(self.trunkVolume - self.trunkFree) м3 груза")
            } else {
                throw TrunkCarError.toBigVolume
            }
        }
    }
}//конец класса


//Создаем первый объект класса
var trunkCar1 = TrunkCar(brand: "ЗИП", yearOfManufacture: 1980, fuelTank: .full, trunkVolume: 10, trunkFree: 10)
trunkCar1.changeConditionWithIF(action: .refuelCar)
trunkCar1.changeConditionWithIF(action: .loadTrunk(valueWeight: 9))
trunkCar1.changeConditionWithIF(action: .loadTrunk(valueWeight: 2))
trunkCar1.changeConditionWithIF(action: .unloadTrunk(valueWeight: 10))
trunkCar1.changeConditionWithIF(action: .loadTrunk(valueWeight: 1))
trunkCar1.changeConditionWithIF(action: .unloadTrunk(valueWeight: 10))
// Проверяем его на ошибки
    do {
        try trunkCar1.changeConditionWithCatch(action: .loadTrunk(valueWeight: 10))
    } catch TrunkCarError.gasolineIisFull {
        print("Ошибка - запрявлять не нужно, бак и так полный")
    } catch TrunkCarError.overloaded {
        print("Ошибка - груз слишком велик, попробуйте загрузить поменьше")
    } catch TrunkCarError.toBigVolume {
        print("Ошибка - в кузове нет столько груза. Введите корректные значения")
    }

//Создаем второй объект и проверяем его на ошибки
var trunkCar2 = TrunkCar (brand: "BMW", yearOfManufacture: "unknow", fuelTank: .empty, trunkVolume: 20, trunkFree: 20)

trunkCar2.changeConditionWithIF(action: .loadTrunk(valueWeight: 10))
do {
    try trunkCar2.changeConditionWithCatch(action: .refuelCar)
} catch TrunkCarError.gasolineIisFull {
    print("Ошибка - запрявлять не нужно, бак и так полный")
} catch TrunkCarError.overloaded {
    print("Ошибка - груз слишком велик, попробуйте загрузить поменьше")
} catch TrunkCarError.toBigVolume {
    print("Ошибка - в кузове нет столько груза. Введите корректные значения")
}











