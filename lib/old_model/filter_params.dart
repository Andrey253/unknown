class FilterParams {
  final List<String> listBrands;
  final List<String> listPrices;
  final List<String> listSizes;
  final String brand;
  final String price;
  final String size;
  FilterParams({
    required this.listBrands,
    required this.listPrices,
    required this.listSizes,
    required this.brand,
    required this.price,
    required this.size,
  });

 

  @override
  bool operator ==(covariant FilterParams other) {
    if (identical(this, other)) return true;
  
    return 
      other.brand == brand &&
      other.price == price &&
      other.size == size;
  }

  @override
  int get hashCode {
    return 
      brand.hashCode ^
      price.hashCode ^
      size.hashCode;
  }

  FilterParams copyWith({
    List<String>? listBrands,
    List<String>? listPrices,
    List<String>? listSizes,
    String? brand,
    String? price,
    String? size,
  }) {
    return FilterParams(
      listBrands: listBrands ?? this.listBrands,
      listPrices: listPrices ?? this.listPrices,
      listSizes: listSizes ?? this.listSizes,
      brand: brand ?? this.brand,
      price: price ?? this.price,
      size: size ?? this.size,
    );
  }
}
