//03. 문자열 뒤집기
//myCode
let s: [Int] = Array(readLine()!).map{Int(String($0))!}

var zero: Bool = false
var one: Bool = false

var zeroCnt = 0
var oneCnt = 0

if s[0] == 1 {
    one = true
    oneCnt += 1
} else {
    zero = true
    zeroCnt += 1
}

if s.count == 1 {
    print(1)
} else {
    for i in s[1...] {
        if zero {
            if i == 0 {
                continue
            } else {
                zero = false
                one = true
                oneCnt += 1
            }
        } else {
            if i == 1{
                continue
            } else {
                one = false
                zero = true
                zeroCnt += 1
            }
        }
    }
    print(zeroCnt < oneCnt ? zeroCnt : oneCnt)
}

//answer
let s: [Character] = Array(readLine()!)
var count0 = 0
var count1 = 0
if s[0] == "1" { count0 += 1}
else {count1 += 1}

let len = s.count
for i in 0..<len-1 {
    if s[i] != s[i+1] {
        if s[i+1] == "1" {
            count0 += 1
        }
        else {
            count1 += 1
        }
    }
}

print(min(count0,count1))

















