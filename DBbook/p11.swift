//11 뱀

let n = Int(readLine()!)!
let k = Int(readLine()!)!
var graph = Array(repeating: Array(repeating: 0, count: n), count: n)
var dir = [(Int,Character)]()
var snakePos = [(Int,Int)]()


for _ in 0..<k {
    let applePos = readLine()!.split(separator: " ").map{Int(String($0))!}
    let row = applePos[0]-1, col = applePos[1]-1
    graph[row][col] = 1
}

var l = Int(readLine()!)!
for _ in 0..<l {
    let dirInfo = readLine()!.split(separator: " ").map{String($0)}
    let second = Int(dirInfo[0])!, direction = Character(dirInfo[1])
    dir.append((second,direction))
}

//꼬리관리가 핵심. 뱀위치 배열을 만들어서 관리..!
var dirRow = [-1,0,1,0]
var dirCol = [0,1,0,-1]

search()

func outOfRange(_ row: Int, _ col: Int) -> Bool {
    //범위 밖으로 나갔을때
    if !(row>=0 && row<n && col>=0 && col<n){
        return false
    }
    //자신의 몸을 만났을때
    for body in snakePos {
        if body == (row,col) {
            return false
        }
    }
    
    return true
}

func search() {
    var sec = 0
    var currentPos: (Int,Int,Int) = (0,0,1)
    snakePos.append((0,0))
    
    while true {
        sec += 1
        var nextX = currentPos.0 + dirRow[currentPos.2]
        var nextY = currentPos.1 + dirCol[currentPos.2]
        var nextDir = currentPos.2
    
        //print("nextx,nexty,nextdir,sec",nextX,nextY,nextDir,sec)
        //print("snakePos",snakePos)
        
        if outOfRange(nextX, nextY) == false {
            print(sec)
            break
        }
        
        snakePos.append((nextX,nextY))
        //사과를 먹었을때
        if graph[nextX][nextY] == 1 {
            graph[nextX][nextY] = 0
        }
        //사과를 안먹었을때
        else {
            snakePos.removeFirst()
        }
        
        if let d = dir.first {
            if d.0 == sec {
                if d.1 == "L" {
                    //print("왼쪽으로 방향전환!")
                    nextDir -= 1
                    if nextDir == -1 {
                        nextDir = 3
                    }
                } else {
                    //print("오른쪽으로 방향전환!")
                    nextDir += 1
                    if nextDir == 4 {
                        nextDir = 0
                    }
                }
                dir.removeFirst()
            }
        }
        
        currentPos = (nextX,nextY,nextDir)
    }
}

