//p28 고정점찾기

func binarySearch(_ arr: [Int], _ n: Int) -> Int {
    var s = 0 , e = n-1, mid = 0
    while s<=e {
        mid = (s+e)/2
        if mid == arr[mid] {
            return mid
        } else if mid < arr[mid] {
            e = mid - 1
        } else {
            s = mid + 1
        }
    }
    return -1
}


let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}

let result = binarySearch(arr,n)
print(result)
