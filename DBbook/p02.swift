//02. 곱하기 혹은 더하기

//myCode
let s: [Int] = Array(readLine()!).map{Int(String($0))!}
let len: Int = s.count
var result = s[0]
if len == 1 {
    print(result)
} else {
    for x in s[1...] {
        //다음 컨디션일때만 더하고, 나머지는 모두 곱하는게 이득
        if x == 0 || x == 1 || result == 0 || result == 1 {
            result += x
        } else {
            result *= x
        }
    }
    print(result)
}

//answer
let s: [Int] = Array(readLine()!).map{Int(String($0))!}
var result = s[0]
for x in s[1...] {
    if x<=1 || result<=1 {
        result += x
    } else {
        result *= x
    }
}

print(result)
