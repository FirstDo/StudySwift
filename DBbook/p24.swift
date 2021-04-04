//p24 안테나
let n = Int(readLine()!)!
var pos: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
pos.sort(by:<)

let len = pos.count
var ans = pos[0]
var minDistance = 0
pos[1...].forEach {
    minDistance += abs(pos[0]-$0)
}

var leftSide = 0
var rightSide = len - 1

for i in 1..<len {
    let diff = pos[i] - pos[i-1]
    leftSide += 1
    let distance = minDistance + leftSide * diff - rightSide * diff
    rightSide -= 1
    if minDistance > distance {
        minDistance = distance
        ans = pos[i]
    }
}

print(ans)
