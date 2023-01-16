import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';


class PaymetProductRemoveAndAddButton extends StatelessWidget {
  const PaymetProductRemoveAndAddButton({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: height * 0.05,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 238, 237, 237),
              border: Border.all(color: colorLightGrey),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: const Color.fromARGB(255, 238, 237, 237),
                    minimumSize: Size(width * 0.05, height * 0.05)),
                onPressed: () {
                  // controller.incrementDecrementQty(
                  //   1,
                  //   controller
                  //       .cartList!.products[index].product.id,
                  //   controller.cartList!.products[index].qty,
                  //   controller
                  //       .cartList!.products[index].product.size
                  //       .toString(),
                  // );
                },
                child: const Icon(
                  Icons.delete_outline,
                  color: colorBlack,
                ),
              ),
              Container(
                width: width * 0.13,
                // height: height * 0.05,
                color: const Color.fromARGB(255, 223, 220, 220),
                child: const Center(
                  child: Text(
                    '2',
                    // controller.cartList!.products[index].qty
                    //     .toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: const Color.fromARGB(255, 238, 237, 237),
                      minimumSize: Size(width * 0.05, height * 0.05)),
                  onPressed: () {
                    // controller.incrementDecrementQty(
                    //   1,
                    //   controller
                    //       .cartList!.products[index].product.id,
                    //   controller.cartList!.products[index].qty,
                    //   controller.cartList!.products[index]
                    //       .product.size
                    //       .toString(),
                    // );
                  },
                  child: const Icon(
                    Icons.add,
                    color: colorBlack,
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
