//p23 국영수

let n = Int(readLine()!)!
var list: [(String,Int,Int,Int)] = []

for _ in 0..<n {
    let next = readLine()!.split(separator: " ").map{String($0)}
    let name = next[0]
    let kor = Int(next[1])!
    let eng = Int(next[2])!
    let math = Int(next[3])!

    list.append((name,kor,eng,math))
}

list.sort{
    if $0.1 == $1.1 {
        if $0.2 == $1.2 {
            if $0.3 == $1.3 {
                return $0.0 < $1.0
            }
            return $0.3 > $1.3
        }
        return $0.2 < $1.2
    }
    return $0.1 > $1.1
}

for l in list {
    print(l.0)
}


