//: Playground - noun: a place where people can play

import UIKit

/* http://www.jianshu.com/p/ee16bcf50a59 原文出处 */

/*
 func swap(chars:[Character],  p: Int, q: Int) {
 var temp = chars[p]
 chars[p] = chars[q]
 chars[q] = temp
 }
 */
// 1 在第一个参数前应该加上inout,因为在swift中,struct都是按照值传递,class是按引用传递,数组字典都是Strut,所以要改变原来的chars数组,在其前部加入inout关键字,表示按引用类型
// 2 p,q之前应该加入下划线,swift默认函数的第一个参数是局部(local)变量,而后续参数都是外部(exteranl)变量,外部变量必须声明,如果在p和q前加上下划线,则在调用函数时无需声明外部变量,这样调用起来更简便
// 3 var 改为let temp并没有改变值,用let
func swap(inout chars:[Character],  _ p: Int, _ q: Int) {
    let temp = chars[p]
    chars[p] = chars[q]
    chars[q] = temp
}
func toZero(x:Int) -> Int {
    while  x>0 {
        var x = x
         x -= 1
    }
    return x
}

var names = ["22","333"]

// Assume names is an array holds enough Strings
// for loop
for name in names { }
for i in 0...names.count - 1 { }
for i in 0..<names.count { }
for _ in 0..<names.count { }
for name in names.reverse() { }
//for i in stride(from: 0, to: names.count - 1, by: 2) { }

// while loop
var i = 0
while i < names.count { }
repeat { } while i < names.count

let dict = ["ss":"ss"]
let keys = Array(dict.keys)
var sortedKeys = keys.sort() {
    let value0 = dict[$0]
    let value1 = dict[$1]
    return value0 < value1
}



func strStr(haystack: String, _ needle: String) -> Int {
    var hChars = [Character](haystack.characters)
    var nChars = [Character](needle.characters)
    
    guard hChars.count >= nChars.count else{ return -1 }
    guard nChars.count != 0 else { return 0 }
    
    for i in 0...hChars.count - nChars.count {
        guard hChars[i] == nChars[0] else { continue }
    
        for j in 0...nChars.count {
            guard hChars[i+j] == nChars[j] else{ break }
            if j == nChars.count - 1 {
                return i
            }
            
        }
    
    }
    return -1
}
let a = strStr("22", "444")
a



