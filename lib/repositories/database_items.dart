
final String databaseItemsTable = "dbItems";

class DatabaseItemFields{
  static final List<String> values = [
    id, imageUrl, productName, productPrice, quantity, productType,
    productMg
  ];

  static final String id = 'id';
  static final String imageUrl = 'imageUrl';
  static final String productName = 'productName';
  static final String productPrice = 'productPrice';
  static final String quantity = 'quantity';
  static final String productType = 'productType';
  static final String productMg = 'productMg';
}

class DatabaseItems{
  final int? id;
  final String imageUrl;
  final String productName;
  final int productPrice;
  int quantity;
  final String productType;
  final int productMg;
  DatabaseItems({
    this.id,
    required this.imageUrl,
    required this.productName,
    required this.productPrice,
    required this.quantity,
    required this.productType,
    required this.productMg,
  });

  DatabaseItems copy({
    int? id,
    String? imageUrl,
    String? productName,
    int? productPrice,
    int? quantity,
    String? productType,
    int? productMg
  }) => DatabaseItems(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      productName: productName ?? this.productName,
      productPrice: productPrice ?? this.productPrice,
      quantity: quantity ?? this.quantity,
      productType: productType ?? this.productType,
      productMg: productMg ?? this.productMg
  );

  static DatabaseItems fromJson(Map<String, Object?> json) =>
      DatabaseItems(
          id: json[DatabaseItemFields.id] as int?,
          imageUrl: json[DatabaseItemFields.imageUrl] as String,
          productName: json[DatabaseItemFields.productName] as String,
          productPrice: json[DatabaseItemFields.productPrice] as int,
          quantity: json[DatabaseItemFields.quantity] as int,
          productType: json[DatabaseItemFields.productType] as String,
          productMg: json[DatabaseItemFields.productMg] as int,
      );

  Map<String, Object?> toJson() => {
    DatabaseItemFields.id: id,
    DatabaseItemFields.imageUrl: imageUrl,
    DatabaseItemFields.productName: productName,
    DatabaseItemFields.productPrice: productPrice,
    DatabaseItemFields.quantity: quantity,
    DatabaseItemFields.productType:productType,
    DatabaseItemFields.productMg:productMg
  };
}