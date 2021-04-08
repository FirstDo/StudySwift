//p27 정렬된 배열에서 특정 수의 개수 구하기
//이진탐색 두개 활용

func countValue(_ arr: [Int], _ x: Int) -> Int{
    let n = arr.count

    let leftIdx = binaryLeft(arr,x,n)
    if leftIdx == -1 {
        return -1
    }
    let rightIdx = binaryRight(arr,x,n)
    return rightIdx - leftIdx + 1
}

func binaryLeft(_ arr: [Int], _ x: Int, _ n: Int) -> Int{
    var s = 0, e = n-1, mid = 0
    while s<=e {
        mid = (s+e)/2
        if arr[mid] == x && (mid == 0 || arr[mid-1] < x ) {
            return mid
        } else if arr[mid] >= x {
            e = mid - 1
        } else {
            s = mid + 1
        }
    }
    return -1
}

func binaryRight(_ arr: [Int], _ x: Int, _ n: Int) -> Int{
    var s = 0, e = n-1, mid = 0
    while s<=e {
        mid = (s+e)/2
        if arr[mid] == x && (mid == n-1 || arr[mid+1] > x ) {
            return mid
        } else if arr[mid] > x {
            e = mid - 1
        } else {
            s = mid + 1
        }
    }
    return -1
}



let firstLine = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = firstLine[0]
let x = firstLine[1]
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}

let result = countValue(arr,x)
print(result)
