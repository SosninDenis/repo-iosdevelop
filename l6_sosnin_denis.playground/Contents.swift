// by Sosnin Denis

import Foundation

//Домашнее задание урока №6 "Продивутое ООП"
// 
// 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков

struct Queue<Type: Comparable> {
    
    //Основные свойства "очереди"
    var array = [Type]()
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    //Метод добавления нового элемента в "Очередь"
    mutating func enqueue (_ element: Type) {
        print("Поставили в очередь \(element)")
        array.append(element)
    }

    //Метод исключения элемента из "Очереди"
    mutating func dequeue () -> Type? {
        if isEmpty {
            print("Очередь пустая")
            return nil
        } else {
            print("\(array[0]) ушёл(а) из очереди")
            return array.removeFirst()
        }
    }
  //Метод печати в консоль "Очереди"
    func printQueue(){
        print(self.array)
    }

    
    // 2. Добавить ему несколько методов высшего порядка
   //метод сортировки от большего к меньшему
    mutating func rearrangementBigger() {
        self.array = self.array.sorted() {$0 < $1}
        print("Новый массив по возрастанию:")
        print(array)
    }
    
    //метод сортировки от меньшего к большему
    mutating func rearrangementSmaller() {
        self.array = self.array.sorted() {$0 > $1}
        print("Новый массив по убыванию:")
        print(array)
    }
    
    //метод поиска элемента по имени
    func findElement (element: Type) {
        if (self.array.filter {$0 == element}.count != 0) {
            print("\(element) есть в очереди")
        } else {
            print("\(element) нет в очереди")
        }
    }


    
    // 3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
    subscript(findIndex:Int) -> Int? {
        for (index, _ ) in array.enumerated() {
            if index == findIndex {
                print("Обращение к \(index) элементу в очереди. Это \(array[index])")
                return findIndex
            }
        }
        print("Элемента с таким индексом не существует")
        return nil
    }

}
var ochered = Queue<String>()
ochered.enqueue("Коля")
ochered.enqueue("Баба Валя")
ochered.enqueue("Петрович")
ochered.enqueue("Баба Галя")
ochered.enqueue("Макс")
ochered.enqueue("Пётр")


ochered.printQueue()
ochered.dequeue()
ochered.rearrangementBigger()
ochered.rearrangementSmaller()
ochered[6]
ochered[1]

ochered.findElement(element: "Баба Галя")


var ochered1 = Queue<Int>()
ochered1.enqueue(1)
ochered1.enqueue(1)
ochered1.enqueue(4)
ochered1.enqueue(1)
ochered1.enqueue(3)
ochered1.enqueue(1)
ochered1.enqueue(2)
ochered1[123]
ochered1[1]
ochered1.dequeue()
ochered1.printQueue()
ochered1.rearrangementBigger()
ochered1.rearrangementSmaller()

    
    

