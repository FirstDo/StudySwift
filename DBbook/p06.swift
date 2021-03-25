//06. 무지의 먹방 라이브
//못풀어서 해설확인

import Foundation

public struct Heap<T> {
    var nodes: [T] = []
    let comparer: (T,T) -> Bool
    
    var isEmpty: Bool { return nodes.isEmpty}
    
    init(comparer: @escaping (T,T) -> Bool) { self.comparer = comparer}
    
    func peek() -> T? {return nodes.first}
    
    mutating func insert(_ element: T){
        var index = nodes.count
        nodes.append(element)
        while index > 0, !comparer(nodes[index],nodes[(index-1)/2]) {
            nodes.swapAt(index, (index-1)/2)
            index = (index-1)/2
        }
    }
    
    mutating func delete() -> T? {
        guard !nodes.isEmpty else { return nil}
        if nodes.count == 1 { return nodes.removeFirst()}
        
        let result = nodes.first
        nodes.swapAt(0, nodes.count-1 )
        _ = nodes.popLast()
        var index = 0
        
        while index < nodes.count {
            let left = index * 2 + 1
            let right = left + 1
            if right < nodes.count {
                if comparer(nodes[left], nodes[right]), !comparer(nodes[right], nodes[index]) {
                    nodes.swapAt(right, index)
                    index = right
                } else if !comparer(nodes[left], nodes[index]) {
                    nodes.swapAt(left, index)
                    index = left
                } else {
                    break
                }
            } else if left < nodes.count {
                if !comparer(nodes[left], nodes[index]) {
                    nodes.swapAt(left, index)
                    index = left
                } else {
                    break
                }
            } else {
                break
            }
        }
        return result
    }
}

extension Heap where T: Comparable {
    init() {
        self.init(comparer: >)
    }
}

struct FoodData: Comparable {
    static func < (lhs: FoodData, rhs: FoodData) -> Bool {
        lhs.time < rhs.time
    }
    
    var time: Int
    var num: Int
}


func solution(_ food_times: [Int], _ k: Int64) -> Int {
    let k: Int = Int(k)
    let sum = food_times.reduce(0,+)
    var length = food_times.count
    if sum <= k {
        return -1
    }
    
    var pq: Heap = Heap<FoodData>()
    for i in 0..<length {
        pq.insert(FoodData(time: food_times[i], num: i+1))
    }
    
    var sumValue = 0
    var previous = 0
    
    while sumValue + (pq.peek()!.time - previous)*length <= k {
        let now = pq.delete()!.time
        sumValue += (now-previous)*length
        length-=1
        previous = now
    }
    
    var food = [FoodData]()
    
    while !pq.isEmpty {
        food.append(pq.delete()!)
    }
    
    let foodAnswer = food.sorted{
        return $0.num < $1.num
    }
    
    let targetIndex = (k-sumValue)%length
    return foodAnswer[targetIndex].num
}
