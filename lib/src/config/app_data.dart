import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/models/user_model.dart';

ItemModel apple = ItemModel(
    itemName: "Maça",
    imageUrl: "assets/fruits/apple.png",
    unit: "kg",
    price: 8,
    description: "Maça argentina");

ItemModel grape = ItemModel(
    itemName: "Uva",
    imageUrl: "assets/fruits/grape.png",
    unit: "kg",
    price: 14,
    description: "Uva sem semente");

ItemModel kiwi = ItemModel(
    itemName: "Kiwi",
    imageUrl: "assets/fruits/kiwi.png",
    unit: "kg",
    price: 18,
    description: "Melhor fruta");

ItemModel papaya = ItemModel(
    itemName: "Mamão Papaya",
    imageUrl: "assets/fruits/papaya.png",
    unit: "un",
    price: 1.50,
    description: "Não gosto de mamão");

ItemModel mango = ItemModel(
    itemName: "Manga",
    imageUrl: "assets/fruits/mango.png",
    unit: "kg",
    price: 12,
    description: "Só o suco que é bom");

List<ItemModel> listFruits = [apple, grape, kiwi, papaya, mango];

List<String> categories = [
  'Frutas',
  'Legumes',
  'Verduras',
  'Temperos',
  'Cereais',
  'Grãos'
];

List<CartItemModel> cartList = [
  CartItemModel(item: kiwi, quantity: 2),
  CartItemModel(item: apple, quantity: 3),
  CartItemModel(item: grape, quantity: 1),
];

UserModel userMock = UserModel(
    nome: "Julio",
    celular: "48991455898",
    email: "email@gmail.com",
    cpf: "00000000000",
    senha: "senha");

List<OrderModel> orders = [
  OrderModel(
      copyPaste: '94a65366-01ef-4fc9-8021-9a8fa8f108ab',
      orderDate: DateTime.now(),
      items: cartList,
      id: '1f9f9476-c516-4acd-9ff9-e270c290b683',
      overdueDate: DateTime.parse("2023-10-30 11:00:00.000"),
      status: 'panding_payment',
      total: 0)
];
