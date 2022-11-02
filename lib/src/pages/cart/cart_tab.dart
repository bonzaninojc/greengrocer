import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/pages/cart/components/cart_tile.dart';
import 'package:greengrocer/src/pages/orders/components/payment_dialog.dart';
import 'package:greengrocer/src/services/utils_services.dart';
import 'package:greengrocer/src/config/app_data.dart' as appData;

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilsServices utils = UtilsServices();

  void removeItemFromCart(CartItemModel item) {
    setState(() {
      appData.cartList.remove(item);
    });
  }

  double totalPriceCart() {
    double total = 0;
    for (var item in appData.cartList) {
      total += item.totalPrice();
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carinho"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: appData.cartList.length,
              itemBuilder: (context, index) {
                return CartTile(
                    calculateTotalPrice: totalPriceCart,
                    itemCart: appData.cartList[index],
                    remove: removeItemFromCart);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 3,
                      spreadRadius: 2)
                ],
                color: Colors.white,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Total Geral",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  utils.priceToCurrency(totalPriceCart()),
                  style: TextStyle(
                      color: CustomColors.customSwatchColor,
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.customSwatchColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18))),
                      onPressed: () async {
                        bool? confirmationOrder = await showOrderConfirmation();
                        if (confirmationOrder ?? false) {
                          showDialog(
                              context: context,
                              builder: ((context) {
                                return PaymentDialog(
                                  order: appData.orders.first,
                                );
                              }));
                        }
                      },
                      child: const Text(
                        "Confirmar Pedido",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: const Text("Confirmação"),
            content: const Text("Deseja concluir a compra ?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text("Não"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text("Sim"),
              ),
            ],
          );
        });
  }
}
