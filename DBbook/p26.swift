//p26 카드정렬하기

struct Heap<T> {
    var nodes: [T] = []
    var comparer: (T,T) -> (Bool)

    var isEmpty: Bool {
        return nodes.isEmpty
    }

    var count: Int {
        return nodes.count
    }

    init(comparer: @escaping (T,T) -> Bool) {
        self.comparer = comparer
    }

    mutating func insert(_ element: T) {
        var index = nodes.count
        nodes.append(element)
        while index > 0, !comparer(nodes[index], nodes[(index-1)/2]) {
            nodes.swapAt(index,(index-1)/2)
            index = (index-1)/2
        }
    }

    mutating func delete() -> T? {
        guard !nodes.isEmpty else { return nil}
        if nodes.count == 1 {
            return nodes.removeFirst()
        }

        let result = nodes.first
        nodes.swapAt(0,nodes.count - 1)
        _ = nodes.popLast()
        var index = 0

        while index < nodes.count {
            let left = index * 2 + 1
            let right = left + 1
            if right < nodes.count {
                if comparer(nodes[left],nodes[right]), !comparer(nodes[right],nodes[index]) {
                    nodes.swapAt(index,right)
                    index = right
                } else if !comparer(nodes[left], nodes[index]) {
                    nodes.swapAt(left,index)
                    index = left
                } else {
                    break
                }
            } else if left < nodes.count {
                if !comparer(nodes[left],nodes[index]) {
                    nodes.swapAt(left,index)
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

let n = Int(readLine()!)!
var heap: Heap<Int> = Heap<Int>()

for _ in 0..<n {
    heap.insert(Int(readLine()!)!)
}

if heap.count <= 2 {
    if heap.count == 1 {
        print(0)
    } else {
        print(heap.delete()!+heap.delete()!)
    }
} else {

    var sum = 0
    while heap.count > 1 {
        let n1 = heap.delete()!
        let n2 = heap.delete()!
        let num = n1 + n2
        sum += num
        heap.insert(num)
    }

    print(sum)
}




