//: Playground - noun: a place where people can play

import UIKit


// https://www.uraimo.com/2016/01/06/10-Swift-One-Liners-To-Impress-Your-Friends/
//#1 数组中每个元素都乘以2
(1...1024).map{$0 * 2}
//#2 一个数组求和
(1...1024).reduce(0, combine: +)
//#3 验证在字符串中是否存在
let words = ["Swift","iOS","cocoa","OSX","tvOS"]
let tweet = "This is an example tweet larking about iOS"
let vaild = !words.filter { tweet.containsString($0) }.isEmpty
vaild
// better alternatives
words.contains(tweet.containsString)
// more concise
tweet.characters.split(" ").lazy.map(String.init).contains(Set(words).contains)

//#4 读取文件
let path = NSBundle.mainBundle().pathForResource("test", ofType:"txt")
let lines = try?String(contentsOfFile: path!).characters.split{$0 == "\n"}.map(String.init)

if let lines = lines {
    lines[0] // O! for a Muse of fire, that would ascend
    lines[1] // The brightest heaven of invention!
    lines[2] // A kingdom for a stage, princes to act
    lines[3] // And monarchs to behold the swelling scene.
}

// That last step with map and the string constructor turns our arrays of characters into strings.
//最后一步使用 map 函数和字符串的构造方法，将数组中的每个元素从字符数组（characters）转换为字符串。

// #5 This will display the Happy Birthday song to console, a simple use of map with a range and the ternary operator.
let name = "BinMo"
(1...4).forEach{print("Happy Birthday " + (($0 == 3) ? "dear \(name)" : "to you"))}

// #6 过滤数组中的数字

extension SequenceType{
    typealias Element = Self.Generator.Element
    func partitionBy(filter:(Element)->Bool) -> ([Element],[Element]) {
        var first = [Element]()
        var second = [Element]()
        
        for element in self {
            if filter(element) {
                first.append(element)
            }else{
            
                second.append(element)
            }
        }
        return (first,second)
    }
}

let part = [82,58,76,49,88,90].partitionBy({$0 < 90})
part


// 优化

extension SequenceType{

    func anotherPartitionBy(fu:(Self.Generator.Element)->Bool) -> ([Self.Generator.Element],[Self.Generator.Element]) {
        return (self.filter(fu),self.filter{ !fu($0) })
    }
}
let part2 = [82,58,76,49,88,90].anotherPartitionBy{$0 < 90}
part2

// reduce 
var part3 = [82,58,76,49,88,90].reduce(([],[]), combine: {

    (a:([Int],[Int]),n:Int) -> ([Int],[Int]) in
    (n<60) ? (a.0+[n],a.1) : (a.0,a.1+[n])
})
part3
// What we are doing here is building the result tuple that contains the two partitions, an element at a time, testing each element of the original sequence using the filtering function and appending this element to the first or second partition array depending on the filtering result.

// Finally a true one liner but notice that the fact that the partition arrays are being built via append will actually make it way slower than the two previous implementations.

// reduce方法把数组元素组合计算为一个值。
// filter用于选择数组元素中满足某种条件的元素。
// map用于将每个数组元素通过某个方法进行转换。


// #7 Fetch and Parse an XMLweb service
//This time we are going to use the pure-Swift AEXML: https://github.com/tadija/AEXML

let xmlDoc = try? AEXMLDocument(xmlData: NSData(contentsOfURL: NSURL(string:"https://www.ibiblio.org/xml/examples/shakespeare/hen_v.xml")!)!)
if let xmlDoc = xmlDoc{
    
    var prologue = xmlDoc.root.children[6]["PROLOGUE"]["SPEECH"]
    prologue.children[1].stringValue // Now all the youth of England are on fire,
    prologue.children[2].stringValue // And silken dalliance in the wardrobe lies:
    prologue.children[3].stringValue // Now thrive the armourers, and honour's thought
    prologue.children[4].stringValue // Reigns solely in the breast of every man:
    prologue.children[5].stringValue // They sell the pasture now to buy the horse,
}


//#8 Find mininum(or maximum) in a list
// find mininum
[10,-22,753,55,137,-1,-279,1034,77].sort().first
[10,-22,753,55,137,-1,-279,1034,77].reduce(Int.max, combine: min)
[10,-22,753,55,137,-1,-279,1034,77].minElement()

// find maximun
[10,-22,753,55,137,-1,-279,1034,77].sort().last
[10,-22,753,55,137,-1,-279,1034,77].reduce(Int.min,combine: max)
[10,-22,753,55,137,-1,-279,1034,77].maxElement()

//#9 
//#9 Parallel Processing
//
//Some languages allows to enable in a simple and transparent way parallel processing of sequences for functionalities like map and flatMap, to speed up the execution of sequential and independent operations using thread pools under the hood.
//
//This feature is not yet available in Swift but can be built using GCD: http://moreindirection.blogspot.it/2015/07/gcd-and-parallel-collections-in-swift.html


//#10 埃拉托色尼选筛法
// 古老而优秀的埃拉托色尼选筛法被用于找到所有小于给定的上限 n 的质数。
//首先将所有小于 n 的整数都放入一个序列（sequence）中，这个算法会移除每个数字的倍数，直到剩下的所有数字都是质数。为了加快执行速度，我们其实不必检查每一个数字的倍数，当检查到 n 的平方根时就可以停止。

var n = 50
var primes = Set(2...n)
(2...Int(sqrt(Double(n)))).forEach{primes.subtractInPlace((2*$0).stride(through:n,by:$0))}
primes.sort()
// 在外层的区间里，我们遍历每一个需要检查的数字。对于每一个数字，我们使用 stride(through:Int by:Int) 函数计算出由它的倍数构成的序列。最初，我们用所有 2 到 n 的整数构造了一个集合（Set），然后从集合中减掉每一个生成的序列中的元素。
// 不过正如你所见，为了真正的删除掉这些倍数，我们使用了一个外部的可变集合，这会带来副作用。
// 我们总是应该尝试消除副作用，所以我们先计算所有的子序列，然后调用 flatMap 方法将其中所有的元素展开，存放到单个数组中，最后再从原始的集合中删除这些整数。

var sameprimes = Set(2...n)
sameprimes.subtractInPlace((2...Int(sqrt(Double(n)))).flatMap{ (2*$0).stride(through:n, by:$0)})
sameprimes.sort()
// 这种写法更加清楚，它也是 使用 flatMap 展开嵌套数组 这篇文章很好的一个例子。 https://www.uraimo.com/2015/10/08/Swift2-map-flatmap-demystified/


//#11 元祖交换
var a = 1,b=2
(a,b) = (b,a)
a
b


