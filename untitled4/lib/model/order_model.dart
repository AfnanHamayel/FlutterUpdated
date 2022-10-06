class OrderModel {
 String id ;
 String totalPrice;

 OrderModel({
   required this.id,
   required this.totalPrice,
 });


 Map<String, dynamic> toMap() {
 return {
 'Id': id,
 'TotalPrice': totalPrice,


 };
 }

 factory OrderModel.fromMap(Map<String, dynamic> map) {
 return OrderModel(
   id: map['Id'] as String,
   totalPrice: map['TotalPrice'] as String,
 );
 }

}