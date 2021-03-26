//dfs bfs
func dfs(_ start: Int, _ graph: [[Int]]) -> String {
    var visited: [Bool] = [Bool](repeating: false, count: N+1)
    var stack: [Int] = [start]
    var ans: String = ""
    while !stack.isEmpty {
        let node = stack.popLast()!
        if visited[node] {continue}
        
        visited[node] = true
        ans += "\(node)"
        stack += graph[node]
    }
    return ans
}

func bfs(_ start: Int, _ graph: [[Int]]) -> String {
    var ans: String = ""
    var startIdx = 0
    var queue: [Int] = [start]
    var visited: [Bool] = [Bool](repeating: false, count: N+1)
    while startIdx<queue.count {
        let now = queue[startIdx]
        startIdx += 1
        
        if visited[now] {continue}
        
        visited[now] = true
        ans += "\(node)"
        queue += graph[now]
    }
    return ans
}
