import 'package:e_commerce/Screens/cart/controller/cart_controller.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';

class AddAndRemoveButton extends StatelessWidget {
  const AddAndRemoveButton({
    Key? key,
    required this.height,
    required this.width,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final double height;
  final double width;
  final CartController controller;
  final int index;

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
                  controller.incrementDecrementQty(
                    1,
                    controller.cartList!.products[index].product.id,
                    controller.cartList!.products[index].qty,
                    context,
                    controller.cartList!.products[index].product.size
                        .toString(),
                  );
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
                child: Center(
                    child: Text(
                  controller.cartList!.products[index].qty.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: const Color.fromARGB(255, 238, 237, 237),
                      minimumSize: Size(width * 0.05, height * 0.05)),
                  onPressed: () {
                    controller.incrementDecrementQty(
                      1,
                      controller.cartList!.products[index].product.id,
                      controller.cartList!.products[index].qty,
                      context,
                      controller.cartList!.products[index].product.size
                          .toString(),
                    );
                  },
                  child: const Icon(
                    Icons.add,
                    color: colorBlack,
                  ))
            ],
          ),
        ),
        kWidth10,
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: colorWhite,
              minimumSize: Size(width * 0.2, height * 0.05),
              side: const BorderSide(
                width: 1,
                color: colorLightGrey,
              )),
          onPressed: () {},
          child: const Text(
            'Delete',
            style: TextStyle(color: colorBlack),
          ),
        )
      ],
    );
  }
}
