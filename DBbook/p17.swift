//17 경쟁적 전염
let firstLine = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = firstLine[0], k = firstLine[1]
var graph: [[Int]] = []
var virus: [(Int,Int,Int,Int)] = []

for i in 0..<n {
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph.append(line)
    for j in 0..<n {
        if line[j] != 0 {
            let v = (i,j,line[j],0)
            virus.append(v)
        }
    }
}

virus.sort{
    return $0.2 < $1.2
}

let secondLine = readLine()!.split(separator: " ").map{Int(String($0))!}
let s = secondLine[0], x = secondLine[1]-1, y = secondLine[2]-1

func bfs() {
    let dx = [1,-1,0,0]
    let dy = [0,0,-1,1]
    func possible(_ x: Int, _ y: Int) -> Bool {
        if x>=0 && x<n && y>=0 && y<n {
            return graph[x][y] == 0
        }
        return false
    }

    var startIdx = 0
    var queue = virus
    while startIdx < queue.count {
        let now = queue[startIdx]
        startIdx += 1
        
        if now.3 == s {
            break
        }
        
        for i in 0..<4 {
            let (nx,ny) = (now.0 + dx[i], now.1 + dy[i])
            if possible(nx,ny) {
                graph[nx][ny] = now.2
                queue.append((nx,ny,now.2,now.3+1))
            }
        }
    }
}

bfs()
print(graph[x][y])

