import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/pages/widgtes/quantity_widget.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class CartTile extends StatefulWidget {
  final CartItemModel itemCart;
  final Function(CartItemModel) remove;
  final Function() calculateTotalPrice;

  CartTile(
      {super.key,
      required this.itemCart,
      required this.remove,
      required this.calculateTotalPrice});

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilsServices utils = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        //imagem
        leading: Image.asset(
          widget.itemCart.item.imageUrl,
          height: 60,
          width: 60,
        ),

        //titulo
        title: Text(
          widget.itemCart.item.itemName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),

        subtitle: Text(
          utils.priceToCurrency(widget.itemCart.totalPrice()),
          style: TextStyle(
              color: CustomColors.customSwatchColor,
              fontWeight: FontWeight.bold),
        ),

        trailing: QuantityWidget(
          unity: widget.itemCart.item.unit,
          quantity: widget.itemCart.quantity,
          isRemovable: true,
          result: (quantityBag) {
            setState(() {
              widget.itemCart.quantity = quantityBag;
              if (quantityBag == 0) {
                widget.remove(widget.itemCart);
                widget.calculateTotalPrice();
              }
            });
          },
        ),
      ),
      //quantidade
    );
  }
}
