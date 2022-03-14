import 'package:flutter/material.dart';
import 'package:sabka_bazaar/model_handlers/cart_handler.dart';
import 'package:sabka_bazaar/screens/checkout_screen.dart';
import 'package:sabka_bazaar/utils/custom_colors.dart';
import 'package:sabka_bazaar/widgets/common_widgets/widgets.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartHandler cartHandler = CartHandler();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                color: CustomColors.kNavColor,
                child: Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          child: const Padding(
                            padding: EdgeInsets.only(left: 10, bottom: 10),
                            child: Text(
                              'My Cart',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        )),
                    Expanded(flex: 4, child: Container()),
                    Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 10, bottom: 0),
                            child: TextButton(
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                              onPressed: () => Navigator.of(context).pop(null),
                            ),
                          ),
                        ))
                  ],
                ),
              )),
          Expanded(
            flex: 10,
            child: cartHandler.getProductCount() >= 0
                ? Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Expanded(
                            flex: 15,
                            child: Container(
                              alignment: Alignment.center,
                              child: Container(color: Colors.yellow,)/*Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'No items in your cart',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontFamily: 'RobotoCondensed',
                                        decoration: TextDecoration.none),
                                  ),
                                  Text(
                                    'Your favourite items are just a click away',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontFamily: 'RobotoCondensed',
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.none),
                                  ),
                                ],
                              )*/,
                            ),
                        ),
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            width: (MediaQuery.of(context).size.width) - 20,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 40),
                              child: longButtons(
                                'Checkout',
                                () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CheckoutScreen()));
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Expanded(
                            flex: 15,
                            child: Container(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'No items in your cart',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontFamily: 'RobotoCondensed',
                                        decoration: TextDecoration.none),
                                  ),
                                  Text(
                                    'Your favourite items are just a click away',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontFamily: 'RobotoCondensed',
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.none),
                                  ),
                                ],
                              ),
                            )),
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            width: (MediaQuery.of(context).size.width) - 20,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 40),
                              child: longButtons(
                                'Start Shopping',
                                () {
                                  Navigator.of(context).pop(null);
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
