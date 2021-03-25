//10자물쇠와 열쇠
//못풀어서 답지 보고 품

//2차원 배열을 90도 회전하는 코드
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

func check(_ newLockArray: [[Int]]) -> Bool{
    let len = newLockArray.count / 3
    for i in len ..< len*2 {
        for j in len ..< len*2 {
            if newLockArray[i][j] != 1 {
                return false
            }
        }
    }
    return true
}

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    var key = key
    let n = lock.count
    let m = key.count
    
    var newLock: [[Int]] = Array(repeating: Array(repeating: 0, count: n*3), count: n*3)
    for i in 0..<n {
        for j in 0..<n {
            newLock[i+n][j+n] = lock[i][j]
        }
    }
    
    for _ in 0..<4 {
        key = rotate90(key)
        for x in 0 ..< n*2 {
            for y in 0 ..< n*2 {
                for i in 0..<m {
                    for j in 0..<m {
                        newLock[x+i][y+j] += key[i][j]
                    }
                }
        
                if check(newLock) == true {
                    return true
                }
                
                for i in 0..<m {
                    for j in 0..<m {
                        newLock[x+i][y+j] -= key[i][j]
                    }
                }
                
                if check(newLock) == true {
                    return true
                }
            }
        }
    }
    return false
}
