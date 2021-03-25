//08문자열 재정렬
//myCode == Answer
 let str = Array(readLine()!)
 
 var result = 0
 var alpha: [Character] = []
 
 str.forEach{
    if let num = Int(String(($0))) {
        result += num
    } else {
        alpha.append($0)
    }
 }
 alpha.sort(by: <)
 
 var answer: String = String(alpha) + String(result)
 print(answer)

