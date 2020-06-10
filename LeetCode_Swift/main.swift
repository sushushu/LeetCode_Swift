//
//  main.swift
//  LeetCode_Swift
//
//  Created by softlipa on 2018/12/31.
//  Copyright © 2018年 softlipa. All rights reserved.
//

import Foundation


//var node = Solution_237.init()
//var t = Solution_237.SingleLinkedListNode.init(value:19)
//
//print(t)


//var t = Solution_771.init().numJewelsInStones("aAdfaaasAAAjdjfhjkaaaa", "aAAbbbb")
//
//print(t)



var t = Solution_interview_06.ListNode(1)
var t1 = Solution_interview_06.ListNode(3)
var t2 = Solution_interview_06.ListNode(2)
var t3 = Solution_interview_06.ListNode(7)
var t4 = Solution_interview_06.ListNode(8)
var t5 = Solution_interview_06.ListNode(9)
var t6 = Solution_interview_06.ListNode(8)
var t7 = Solution_interview_06.ListNode(9)



t.next = t1;
t1.next = t2;
t2.next = t3;
t3.next = t4;
t4.next = t5;
t5.next = t6;
t6.next = t7;
t7.next = nil;

//t.next = nil
//t = ni

//var funccc = Solution_interview_06.init()
//print(funccc.reversePrint(t))

var i = 0
var m_array = Array<Solution_interview_06.ListNode>()
let randomNum = arc4random() % 10000

while i < 10000 {
    i += 1
    let t = (Solution_interview_06.ListNode(i))
    m_array.append(t)
}

for e in m_array {
    print(e.val)
}
