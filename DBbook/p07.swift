//07. 럭키 스트레이트
//myCode == Answer
let score = Array(readLine()!).map{Int(String($0))!}

let len = score.count

let leftScore = score[0..<len/2].reduce(0,+)
let rightScore = score[len/2..<len].reduce(0,+)

if leftScore == rightScore {
    print("LUCKY")
} else {
    print("READY")
}
