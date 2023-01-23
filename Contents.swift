let array = [1,2,3,4,5,6]

// 関数を使った場合
func addOne(n1: Int) -> Int {
    return n1 + 1
}
array.map(addOne)

// クロージャーの省略なし
array.map({(n1: Int) -> Int in
    return n1 + 1
})

// クロージャーの型を省略
array.map({(n1) in
    n1 + 1
})

// クロージャーの省略完全版。第一引数は$0と書ける
array.map({ $0 + 1 })

