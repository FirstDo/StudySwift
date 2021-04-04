//p15 특정 거리의 도시 찾기
let firstLine = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = firstLine[0], m = firstLine[1], k = firstLine[2], x = firstLine[3]
var graph: [[Int]] = Array(repeating: [], count: n+1)
var distance: [Int] = Array(repeating: -1, count: n+1)
distance[x] = 0

for _ in 0..<m {
    let city = readLine()!.split(separator: " ").map{Int(String($0))!}
    let from = city[0], to = city[1]
    graph[from].append(to)
}

func bfs() {
    var queue = [x]
    var startIdx = 0
    
    while startIdx < queue.count {
        let now = queue[startIdx]
        startIdx += 1
        
        for next in graph[now] {
            if distance[next] == -1 {
                distance[next] = distance[now] + 1
                queue.append(next)
            }
        }
    }
}

bfs()
var ans = ""
for i in 1..<distance.count {
    if distance[i] == k {
        ans += "\(i)\n"
    }
}

if ans == "" {
    print(-1)
} else {
    print(ans)
}
