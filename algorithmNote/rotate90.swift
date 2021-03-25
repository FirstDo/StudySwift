func rotate90 (_ arr: [[Int]]) -> [[Int]] {
    let n = arr.count
    let m = arr[0].count
    
    var nextArr: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: m)
    for i in 0..<n {
        for j in 0..<m {
            nextArr[j][n-i-1] = arr[i][j]
        }
    }
    return nextArr
}
