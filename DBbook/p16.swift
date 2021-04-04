//p16 연구소
let firstLine = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = firstLine[0], m = firstLine[1]
var graph: [[Int]] = []
var blank: [(Int,Int)] = []
var virus: [(Int,Int)] = []
var answer = 0

for i in 0..<n {
    graph.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

for i in 0..<n {
    for j in 0..<m {
        if graph[i][j] == 0 {
            blank.append((i,j))
        } else if graph[i][j] == 2 {
            virus.append((i,j))
        }
    }
}


func dfs(_ map: [[Int]]) {
    let dx = [1,-1,0,0]
    let dy = [0,0,-1,1]
    var map = map
    
    func validIndex(_ x: Int, _ y: Int) -> Bool{
        if x>=0 && x<n && y>=0 && y<m {
            return map[x][y] == 0
        } else { return false}
    }
    
    var count = 0
    var stack = virus
    while !stack.isEmpty {
        let now = stack.popLast()!

        for i in 0..<4 {
            let (nextX,nextY) = (now.0+dx[i], now.1+dy[i])
            if validIndex(nextX, nextY) {
                map[nextX][nextY] = 2
                stack.append((nextX,nextY))
            }
        }
    }
    
    for m in map {
        _ = m.map{
            if $0 == 0 {
                count += 1
            }
        }
    }
    
    answer = max(answer,count)
    
}

func makeWall(_ graph: [[Int]]){
    let len = blank.count
    
    for i in 0..<len-2 {
        for j in i+1..<len-1 {
            for k in j+1..<len {
                var graph = graph
                let w1 = blank[i]
                let w2 = blank[j]
                let w3 = blank[k]
                graph[w1.0][w1.1] = 1
                graph[w2.0][w2.1] = 1
                graph[w3.0][w3.1] = 1
                dfs(graph)
            }
        }
    }
}

makeWall(graph)
print(answer)
