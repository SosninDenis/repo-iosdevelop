// by Sosnin Denis

import Foundation

// Задание №1 "Написать функцию, которая определяет четное число или нет"

var example: Int

func checkingChetality (number:Int) -> Bool {
    var result:Bool
    if (number == 0) { // проверка не является ли число 0
        print("число 0 не является ни чётным, ни нечётным")
        result = false // вовращение функции
        return result
    } else if (number % 2 == 0) { //условие чётности
        print("число \(number) чётное")
        result = true
        return result
    } else { //условие нечётности
        print("число \(number) нечётное")
        result = false
        return result
    }
}
checkingChetality(number:3) //проверка работы функции проверки четности


// Задание №2 "Написать функцию, которая определяет делиться ли число без остатка на 3"
func checkingDivisionByThree (number:Int) -> Bool {
    var result:Bool
    if (number % 3 == 0) { //условие деления на три без остатка
        print("число \(number) делется на три без остатка")
        result = true
        return result
    } else { //условие нечётности
        print("число \(number) не делется на три без остатка")
        result = false
        return result
    }
}
checkingDivisionByThree(number: 6) //проверка работы функции деления на три



//Задание №3 "Создать возрастающий массив из 100 чисел"
var simpleArray = [Int]() // создание пустого массива
simpleArray.append(Int.random (in: 0..<5)) //создание 0-ого элемента массива
for i in 1...99 { //цикл добавления новых элементов с №№от 1 до 99, каждый из которых больше предыдущего на случайное число
    let elementOfArray = simpleArray[i-1] + Int.random (in: 1..<5)
    simpleArray.append(elementOfArray)
}
simpleArray


// Задание №4 "Удалить из массива все четные числа и все числа, которые не деляться на три"

var subtractionArray = [Int]() // создаем временный пустой массив
for i in 0...99 { //цикл проверки =
    if (!checkingChetality(number: simpleArray[i]))  { //проверка нечетности числа
        if (!checkingDivisionByThree(number: simpleArray[i])) { // проверк "неделимости" на три
        subtractionArray.append (simpleArray[i]) //запись необходимых элементов в новый массив
        }
    }
}
simpleArray = subtractionArray // перезапись массива


//Задание №5 "Функция, которая добавляет в массив новое число Фибоначчи"

func addFibonachchi (numberOfArray:Array<Int>) -> Array<Int> {
    var someArray = numberOfArray
    let length = someArray.count //определение длины входного массива
    if (length == 0) { //генерация первого элемента Фибоначчи
        someArray.append(0)
    } else if (length == 1) { //генерация второго элемента Фибоначчи
        someArray.append(1)
    } else { //генерация последующих элементов
        someArray.append(someArray[length - 1] + someArray[length - 2])
    }
return someArray //вовращение массива
}

//Проверка работы функции addFibonachchi
var n: Int = 50 //размер массива
var fiboArray = [Int]() //объявление результирующего массива
//создание массива с числами Фибоначчи
for _ in 1...n {
   fiboArray = addFibonachchi(numberOfArray: fiboArray)
}
fiboArray


//Задание №6 "Создание массива с 100 простыми числами с помощью метода Эротосфена"

//функция проверки делимости элементов массива на p
func chekingDivisibility (inputArray:Array<Int>, p:Int) ->Array<Int>{
    var chekingArray = inputArray
    for value in chekingArray {
        if (value % p == 0) {
            chekingArray.remove(at: chekingArray.firstIndex(of: value)!)
        }
    }
    return chekingArray
}

// Функция создания начального массива
func createFirstArray (length:Int) -> Array<Int> {
    var newArray = [Int]()
    for i in (2...length){
        newArray.append(i)
    }
 return newArray
}

//основаная часть программы

var finalArray = [Int]() // объявление итоговый массив
var someArray = [Int]() // объявление начального массива
var length:Int = Int.random (in: 2..<1000) // генерация длины
someArray = createFirstArray(length: length) // создание начального массива
repeat {
    let p = someArray[0] // нулевой элемент массива, на первом шаге равен простому числе 2 -> сразу добавляем его в финальный массив
    finalArray.append(p) //добавление простых чисел в финальный массив
    someArray = chekingDivisibility(inputArray: someArray, p: p) //проверка делимости чисел и откидываение ненужных
    print(p)
    // условие расширешение исходного массива чисел
    if (finalArray.count < 100) && (someArray.count == 0) {
        finalArray = [Int]()
        length += 200
        someArray = createFirstArray(length: length)
    }
    
} while (finalArray.count < 100)
finalArray











