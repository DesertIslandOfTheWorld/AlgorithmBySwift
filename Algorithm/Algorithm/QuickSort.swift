//
//  QuickSort.swift
//  Algorithm
//
//  Created by 李云鹏 on 2019/1/23.
//  Copyright © 2019 iddev. All rights reserved.
//

import Foundation


/// 快速排序（升序）
///
/// - Parameters:
///   - array: 待排序数组
///   - low: 待排序数组起始位置
///   - high: 待排序数组结束位置
func quickSort<T: Comparable>(_ array: inout [T], low: Int, high: Int) {
    // 若数组小于两个元素，则无需排序
    guard array.count > 1 else {
        return
    }
    /// 中间索引，会以该索引为中心，将待排序数组划分为两个待排序数组，递归调用 quickSort 方法
    var pivot: Int
    if low < high {
        // 将待排序数组进行一次排序，使比 pivot 位置元素（pivotKey）大的元素排在 pivot 后边，比 pivot 位置元素（pivotKey）小的元素排在 pivot 前边。
        pivot = partition(&array, low, high)
        // 对 pivot 左边元素构成的数组，执行快速排序操作（递归）
        quickSort(&array, low: low, high: pivot - 1)
        // 对 pivot 右边元素构成的数组，执行快速排序操作（递归）
        quickSort(&array, low: pivot + 1, high: high)
    }
}



/// 快速排序的一次递归操作
///
/// - Parameters:
///   - array: 待排序数组
///   - low: 待排序数组起始位置
///   - high: 待排序数组结束位置
/// - Returns: 返回排序后结束后 pivotKey 所在位置的索引
func partition<T: Comparable>(_ array: inout [T], _ low: Int, _ high: Int) -> Int {
    /// 这里取中心点为待排序数组的第一个元素（中心点的选取是影响快速排序性能重要因素）
    let pivotKey = array[low]
    var tempLow = low
    var tempHigh = high
    // 遍历待排序数组
    while tempLow < tempHigh {
        // 从右向左开始遍历数组，将比 pivotKey 大的元素放到 pivotKey 的右边
        while tempHigh > tempLow && array[tempHigh] >= pivotKey {
            tempHigh -= 1
        }
        swap(&array, tempLow, tempHigh)
        // 从左向右开始遍历数组，将比 pivotKey 小的元素放到 pivotKey 的左边
        while tempLow < tempHigh && array[tempLow] <= pivotKey {
            tempLow += 1
        }
        swap(&array, tempLow, tempHigh)
    }
    // 此次遍历结束后，将 pivotKey 的索引返回（pivotKey 用来划分待排序数组）
    return tempLow
}


/// 交换数组中的两个元素
///
/// - Parameters:
///   - array: 待交换元素的数组
///   - low: 待交换元素的索引
///   - high: 待交换元素的索引
func swap<T: Comparable>(_ array: inout [T], _ low: Int, _ high: Int) {
    let temp = array[low]
    array[low] = array[high]
    array[high] = temp
}
