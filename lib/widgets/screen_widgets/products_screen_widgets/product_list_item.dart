import 'package:flutter/material.dart';
import 'package:sabka_bazaar/utils/constants/constants.dart';
import 'package:sabka_bazaar/widgets/common_widgets/widgets.dart';

import '../../../models/product_list_model.dart';

class ProductItemTile extends StatelessWidget {
  const ProductItemTile({Key? key, required this.product}) : super(key: key);

  final Product? product;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              product?.title ?? '',
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Stack(
                  children: [
                    Positioned(
                      top: 10.0,
                      left: 20.0,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          Constants.kInitial,
                          width: 20,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        Constants.kInitial,
                      ),
                    ),
                    Positioned(
                      top: 20.0,
                      right: 20.0,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          Constants.kShellLife,
                          width: 50,
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(product?.pieces ?? ''),
                        ))
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                   Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(
                        product?.description ?? '',
                        maxLines: 5,
                        style: const TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 35.0,
                    ),
                    longButtons('Buy Now @ MRP Rs.${product?.price ?? ''}', () {})
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 2,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
