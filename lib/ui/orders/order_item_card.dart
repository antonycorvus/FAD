import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/order_item.dart';

class OrderItemCard extends StatefulWidget {
  final OrderItem order;
  const OrderItemCard(this.order, {super.key});

  @override
  State<OrderItemCard> createState() => _OrderItemCardState();
}

class _OrderItemCardState extends State<OrderItemCard> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          buildOrderSummary(),
          if (_expanded) buildOrderDetails()
        ],
      ),
    );
  }

  Widget buildOrderDetails(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      height: min(widget.order.productCount * 20.0 + 10, 100),
      child: ListView(
        children: widget.order.products
          .map(
            (prod) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  prod.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 175, 31, 17),
                  ),
                ),
                Text(
                  'Số lượng: ${prod.quantity}    Đơn Giá: \$${prod.price}',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 175, 31, 17),
                  ),
                )
              ],
            ),
          )
          .toList(),
      ),
    );
  }
  Widget buildOrderSummary(){
    return ListTile(
      title: Text('Đơn Hàng: \$${widget.order.amount}'),
      textColor: Color.fromARGB(255, 5, 35, 225),
      subtitle: Text(
        DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime),
      ),
      trailing: IconButton(
        icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
        onPressed: (){
          setState(() {
            _expanded = !_expanded;
          });
        },
      ),
    );
  }
}