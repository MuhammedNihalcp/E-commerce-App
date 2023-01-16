import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';

class PriceDetails extends StatelessWidget {
  const PriceDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      width: double.infinity,
      height: 210,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Price Details',
              style: TextStyle(
                color: colorBlack,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            kHeight20,
            kHeight5,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Price  (1 item)',
                  style: TextStyle(fontSize: 16),
                ),
                Text('₹ 2,999'),
              ],
            ),
            kHeight10,
            kHeight5,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Discount',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '-₹ 2,999',
                  style: TextStyle(color: colorGreen),
                ),
              ],
            ),
            kHeight10,
            kHeight5,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Delivery Charges',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'FREE Delivary',
                  style: TextStyle(
                    color: colorGreen,
                  ),
                ),
              ],
            ),
            kHeight5,
            const Divider(
              thickness: 2,
            ),
            kHeight5,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Total Amount',
                  style: boldtextblackcolor,
                ),
                Text(
                  '₹ 999',
                  style: boldtextblackcolor,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
