import UIKit

var greeting = "Hello, playground"

struct MinHeap {
    
    var items: [Int] = []
    
    private func getLeftChildIndex(_ parentIndex: Int) -> Int {
        return 2*parentIndex + 1
    }
    
    private func getRightChildIndex(_ parentIndex: Int) -> Int {
        return 2*parentIndex + 2
    }
    
    private func getParentIndex(_ childIndex: Int) -> Int {
        return (childIndex-1)/2
    }
    
    private func hasLeftChild(_ index: Int) -> Bool {
        return getLeftChildIndex(index) < items.count
    }
    
    private func hasRightChild(_ index: Int) -> Bool {
        return getRightChildIndex(index) < items.count
    }
    
    private func hasParent(_ index: Int) -> Bool {
        return getParentIndex(index) >= 0
    }
    
    private func leftChild(_ index: Int) -> Int {
        return items[getLeftChildIndex(index)]
    }
    
    private func rightChild(_ index: Int) -> Int {
        return items[getRightChildIndex(index)]
    }
    
    private func parent(_ index: Int) -> Int {
        return items[getParentIndex(index)]
    }
    
    public func peek() -> Int {
        if items.count != 0{
            return items[0]
        } else {
            fatalError()
        }
    }
    /// The function poll() returns and removes the value of the parent node from the Heap. Then, private functions within the Heap are called which rearrange the values in the Heap so that the next smallest (or largest) value becomes the parent node at the top and all others fit in to the place they should.
    mutating func poll() -> Int {
        if items.count != 0 {
            var item = items[0]
            items[0] = items[items.count-1]
            heapifyDown()
            items.removeLast()
            return item
        } else {
            fatalError()
        }
    }
    
    mutating private func heapifyUp() {
        
        var index = items.count - 1
        
        while hasParent(index) && parent(index) > items[index] {
            swap(indexOne: getParentIndex(index), indexTwo: index)
            index = getParentIndex(index)
        }
    }
    
    mutating func heapifyDown() {
        var index = 0
        
        while hasLeftChild(index) {
            var smallerChildIndex = getLeftChildIndex(index)
            if hasRightChild(index) && rightChild(index) < leftChild(index) {
                smallerChildIndex = getRightChildIndex(index)
                print("82..\(smallerChildIndex)")
            }
            print("83...\(items[index]) .. \(index)")
            print("84...\(items[smallerChildIndex])")
            if items[index] < items[smallerChildIndex] {
                break
            } else {
                swap(indexOne: index, indexTwo: smallerChildIndex)
            }
            index = smallerChildIndex
        }
    }
    
    mutating private func swap(indexOne: Int, indexTwo: Int) {
        let placeHolder = items[indexOne]
        items[indexOne] = items[indexTwo]
        items[indexTwo] = placeHolder
    }
    mutating public func add(_ item: Int) {
      items.append(item)
      heapifyUp()
    }
}

var myHeap = MinHeap()

myHeap.add(2)
myHeap.add(10)
myHeap.add(8)
myHeap.add(9)
myHeap.add(7)
myHeap.add(3)
myHeap.add(4)
//dump(myHeap.items)

let result = myHeap.poll()
dump(myHeap.items)


