// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

List<Order> orderFromJson(String str) => List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

String orderToJson(List<Order> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Order {
    Order({
        required this.id,
        required this.total,
        this.address,
        this.paymentStatus,
        this.paymentToken,
        required this.usersId,
        required this.isDelivered,
        this.orderDate,
        required this.orderItems,
    });

    String id;
    String total;
    dynamic address;
    dynamic paymentStatus;
    dynamic paymentToken;
    String usersId;
    String isDelivered;
    DateTime? orderDate;
    List<OrderItem> orderItems;

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        total: json["total"],
        address: json["address"],
        paymentStatus: json["payment_status"],
        paymentToken: json["payment_token"],
        usersId: json["users_id"],
        isDelivered: json["is_delivered"],
        orderDate: json["order_date"] == null ? null : DateTime.parse(json["order_date"]),
        orderItems: List<OrderItem>.from(json["order_items"].map((x) => OrderItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "total": total,
        "address": address,
        "payment_status": paymentStatus,
        "payment_token": paymentToken,
        "users_id": usersId,
        "is_delivered": isDelivered,
        "order_date": orderDate?.toIso8601String(),
        "order_items": List<dynamic>.from(orderItems.map((x) => x.toJson())),
    };
}

class OrderItem {
    OrderItem({
        required this.id,
        required this.orderId,
        required this.productId,
        required this.quantity,
        required this.productName,
        required this.price,
        required this.image,
        required this.categoryId,
        required this.description,
        required this.approved,
    });

    String id;
    String orderId;
    String productId;
    String quantity;
    String productName;
    String price;
    String image;
    String categoryId;
    String description;
    String approved;

    factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        id: json["id"],
        orderId: json["order_id"],
        productId: json["product_id"],
        quantity: json["quantity"],
        productName: json["product_name"],
        price: json["price"],
        image: json["image"],
        categoryId: json["category_id"],
        description: json["description"],
        approved: json["approved"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "product_id": productId,
        "quantity": quantity,
        "product_name": productName,
        "price": price,
        "image": image,
        "category_id": categoryId,
        "description": description,
        "approved": approved,
    };
}
