import 'package:flutter/material.dart';
import 'package:m1/common/const/colors.dart';
import 'package:m1/order/model/order_model.dart';

class OrderCard extends StatelessWidget {
  final DateTime orderDate;
  final Image image;
  final String name;
  final String productsDetail;
  final int price;

  const OrderCard(
      {required this.orderDate,
      required this.image,
      required this.name,
      required this.productsDetail,
      required this.price,
      Key? key})
      : super(key: key);

  factory OrderCard.fromModel({
    required OrderModel model,
  }) {
    final productsDetail = model.products.length < 2
        ? model.products.first.product.name
        : '${model.products.first.product.name} 외${model.products.length - 1}개';

    return OrderCard(
      orderDate: model.createAt,
      image: Image.network(
        model.restaurant.thumbUrl,
        height: 50,
        width: 50,
        fit: BoxFit.cover,
      ),
      name: model.restaurant.name,
      productsDetail: productsDetail,
      price: model.totalPrice,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '${orderDate.year}.${orderDate.month.toString().padLeft(2, '0')}.${orderDate.day.toString().padLeft(2, '0')} 주문완료',
        ),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: image,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  '$productsDetail $price원',
                  style: TextStyle(color: BODY_TEXT_COLOR),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
