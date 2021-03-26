//permutation!
var permutationDist: [[Int]] = []
let dist: [Int] = [1,2,3]
let visited: [Bool] = [Bool](repeating: false, count: dist.count)

func permutation(depth: Int, visited: [Bool], arr: [Int]){
    if depth == dist.count {
        permutationDist.append(arr)
        return
    }
    var visited = visited
    for i in 0..<dist.count {
        if visited[i] {
            continue
        }
        
        visited[i] = true
        permutation(depth: depth+1, visited: visited, arr: arr+[dist[i]])
        visited[i] = false
    }
}


permutation(depth: 0, visited: visited, arr: [])
print(permutationDist)
