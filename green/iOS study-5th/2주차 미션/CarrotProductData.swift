//
//  CarrotProductData.swift
//  iOS study-5th
//
//  Created by 윤지성 on 2023/10/02.
//

import Foundation

struct CarrotProductData{
    let imageURL: String
    let title: String
    let location: String
    let createdAt: String
    let price: String
    let commentCount: Int
    let heartCount: Int
    
    
}

struct CarrotProductDataList{
    let productList: [CarrotProductData] = [
        CarrotProductData(imageURL: "Image 1", title: "아이폰 14 pro 팝니다!", location: "서울시 동작구", createdAt: "1시간 전", price: "870,000원", commentCount: 0, heartCount: 4),
        CarrotProductData(imageURL: "Image 2", title: "맥북 m2 air 급판매", location: "서울시 강남구", createdAt: "3시간 전", price: "2,400,000원", commentCount: 1, heartCount: 6),
        CarrotProductData(imageURL: "Image 3", title: "에어팟 맥스 S급", location: "서울시 방배동", createdAt: "5시간 전", price: "800,000원", commentCount: 2, heartCount: 7),
        CarrotProductData(imageURL: "Image 4", title: "애플 워치 풀박 판매함다", location: "서울시 방배동", createdAt: "1일전", price: "500,000원", commentCount: 5, heartCount: 4),
        CarrotProductData(imageURL: "Image 5", title: "에어패드 걍 새거", location: "서울시 잠원동", createdAt: "2일전", price: "670,000원", commentCount: 2, heartCount: 10)
    ]
}

