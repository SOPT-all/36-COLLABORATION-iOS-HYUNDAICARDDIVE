protocol DataBindableCell {
    associatedtype DataType
    func dataBind(item: DataType)
}
