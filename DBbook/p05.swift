//05. 볼링공 고르기
//myCode
let firstLine = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = firstLine[0]
let m = firstLine[1]
var ball = readLine()!.split(separator: " ").map{Int(String($0))!}

ball.sort(by: <)

let len = ball.count
var count = 0

for i in 0 ..< len-1 {
    for j in i+1 ..< len {
        if ball[i] != ball[j] {
            count += 1
        }
    }
}
print(count)

//answer
let firstLine = readLine()!.split(separator: " ").map{Int(String($0))!}
var n = firstLine[0]
let m = firstLine[1]

var ball = readLine()!.split(separator: " ").map{Int(String($0))!}
var array = [0,0,0,0,0,0,0,0,0,0,0]

for x in ball {
    array[x] += 1
}
var result = 0
for i in 1 ..< m+1 {
    n -= array[i]
    result += array[i] * n
}
print(result)
