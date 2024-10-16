import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/global/global.dart';
import '../../../api model.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  Product data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        backgroundColor: Color(0xffFFFFFF),
        automaticallyImplyLeading: false,
        centerTitle: true,
        leadingWidth: 66,
        leading: Padding(
          padding: EdgeInsets.only(left: 18),
          child: CircleAvatar(
            radius: 26,
            backgroundColor: Color(0xffF5F5F5),
            child: Center(
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(data.image, height: 200),
            ),
            SizedBox(
              height: 20,
            ),
            FittedBox(
              fit: BoxFit.cover,
              child: Text(
                data.title,
                style: Global.size24,
              ),
            ),
            SizedBox(height: 10),
            FittedBox(
              fit: BoxFit.cover,
              child: Text(
                '\$${data.price}',
                style: Global.size22,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                FittedBox(
                  fit: BoxFit.cover,
                  child: Text(
                    '${data.rating['rate']}    ',
                    style: Global.size14,
                  ),
                ),
                FittedBox(
                  fit: BoxFit.cover,
                  child: Text(
                    '${data.rating['count']} Review',
                    style: Global.size14,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              height: h * .22,
              child: Text(
                data.description,
                style: Global.size16,
                overflow: TextOverflow.fade,
              ),
            ),
            Spacer(),
            Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (!addedProducts.contains(data)) {
                      addedProducts.add(data);
                    }
                    Navigator.of(context).pushNamed(
                      'cart',
                    );
                  });
                },
                child: Container(
                  width: w * .7,
                  height: h * .07,
                  decoration: BoxDecoration(
                    color: Global.botonColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                      child: Text(
                    "Add to Cart",
                    style: Global.size16w,
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
