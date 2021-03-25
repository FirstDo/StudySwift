//04. 만들 수 없는 금액
//myCode == answer
let n = Int(readLine()!)!
var coins = readLine()!.split(separator: " ").map{Int(String($0))!}

coins.sort(by: <)

var make = 0
for coin in coins {
    if make + 1 < coin {
        break
    } else {
        make += coin
    }
}
print(make + 1)
