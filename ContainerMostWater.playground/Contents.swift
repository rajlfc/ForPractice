import UIKit

var greeting = "Hello, playground"

class Solution {
    
    func maxArea(_ height: [Int]) -> Int {
        
        if height.isEmpty {
            return 0
        }
        
        var start = 0
        var end = height.count - 1
        var maxArea = 0
        
        
        while start < end {
            let startH = height[start]
            let endH = height[end]
            
            let minH = min(startH,endH)
            let distance = end - start
            maxArea = max(maxArea,distance*minH)
            
            if startH < endH {
                start += 1
            } else {
                end -= 1
            }
        }
        return maxArea
    }
}

let obj = Solution()
var heights = [1,8,6,2,5,4,8,3,7]
print(obj.maxArea(heights))
