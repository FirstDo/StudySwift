//09 문자열 압축
//s가 입력으로 들어온다
//못풀어서 해설확인
import Foundation

func solution(_ s: String) -> Int {
    let str = Array(s)
    var answer = str.count
    let len = answer
    
    for step in 1...len/2 {
        var compressed = ""
        var prev = String(str[0..<step])
        var count = 1
        var remain = ""
        
        for j in stride(from: step, to: len, by: step) {
            if j+step > len {
                remain = String(str[j..<len])
            } else if prev == String(str[j ..< j+step]) {
                count += 1
            } else {
                compressed += count >= 2 ? String(count) + prev : prev
                prev = String(str[j ..< j+step])
                count = 1
            }

        }
        compressed += count >= 2 ? String(count) + prev : prev
        if remain != "" {
            compressed += remain
            remain = ""
        }
        answer = min(answer, compressed.count)
    }
    return answer
}
