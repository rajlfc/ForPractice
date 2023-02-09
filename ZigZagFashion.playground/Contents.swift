import UIKit

var greeting = "Hello, playground"

class SOlution {
    
    func convert(_ s:String,_ numberOfRows: Int) -> String {
        
        if numberOfRows == 1 || numberOfRows > s.count {
            return s
        }
        var rows = Array(repeating: [String](), count: numberOfRows)
        
        var counter = 0
        var canGoDown = false
        var arrayS = Array(s)
        
        for (index,char) in arrayS.enumerated() {
            rows[counter].append(String(char))
            
            if counter == 0 || counter == numberOfRows - 1 {
                canGoDown = !canGoDown
            }
            
            if canGoDown {
                counter += 1
            } else {
                counter -= 1
            }
        }
        
        let results = rows.flatMap{$0}
        return results.joined(separator: "")
    }
}

let obj = SOlution()
obj.convert("PAYPALISHIRING", 3)

/// https://www.youtube.com/watch?v=I-a-TtF1Ep4&list=PLc-iwExxbxLfPLB63Sp-jswj-2m53rETh&index=10
