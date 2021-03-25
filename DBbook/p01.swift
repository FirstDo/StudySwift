//01 모험가 길드

//My Code
//공포도가 x이면 반드시 그룹이 x명 이상이어야 한다.
let n = Int(readLine()!)!
var adventure = readLine()!.split(separator: " ").map{Int(String($0))!}
adventure.sort(by: <)

var maxGroup: Int = 0
var groupNum: Int = 0
var limit: Int = 0

for x in adventure {
    //1일때는 그자체로 그룹가능
    if x == 1 {
        maxGroup += 1
    } else {
        //첫 그룹을 생성. limit와 groupNum
        if groupNum == 0 {
            limit = x
            groupNum = 1
        } else {
            groupNum += 1
            limit = x
            //조건이 충족되면 모험 ㄱㄱ한다.
            if groupNum >= limit {
                maxGroup += 1
                groupNum = 0
            }
        }
    }
}
print(maxGroup)

//Answer

let n = Int(readLine()!)!
var adventure = readLine()!.split(separator: " ").map{Int(String($0))!}
adventure.sort(by: <)

var result = 0
var count = 0

for i in adventure {
    count +=1
    if count >= i {
        result += 1
        count = 0
    }
}

print(result)
