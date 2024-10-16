import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/global/global.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double totalPrice = 0.0;
  @override
  void initState() {
    super.initState();
    for (var element in addedProducts) {
      totalPrice = totalPrice + element.price;
    }
  }

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: const Color(0xffF5F5F5),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Cart Screen",
          style: Global.size22,
        ),
        leadingWidth: 66,
        leading: Padding(
          padding: const EdgeInsets.only(left: 18),
          child: CircleAvatar(
            radius: 26,
            backgroundColor: const Color(0xffFFFFFF),
            child: Center(
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: addedProducts.isNotEmpty
                  ? Column(
                      children: [
                        ...addedProducts.map(
                          (e) => Container(
                            margin: const EdgeInsets.all(20),
                            height: 150,
                            width: w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.black54),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        bottomLeft: Radius.circular(30),
                                      ),
                                      image: DecorationImage(
                                        image: NetworkImage(e.image),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30),
                                        bottomRight: Radius.circular(30),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text("${e.title}",
                                              overflow: TextOverflow.ellipsis,
                                              style: Global.size20),
                                          Text(
                                            "\$${e.price} ",
                                            style: Global.size20,
                                          ),
                                          Text(
                                            "Quantity : 1",
                                            overflow: TextOverflow.ellipsis,
                                            style: Global.size20,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                addedProducts.remove(e);
                                                totalPrice -= e.price as double;
                                              });
                                            },
                                            child: Text("Delete",
                                                style: Global.size20r),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : SizedBox(
                      height: 500,
                      width: 300,
                      child: Center(
                        child: Text(
                          "No Products Available",
                          style: Global.size18black,
                        ),
                      ),
                    ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              color: const Color(0xffF5F5F5),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Total Price ",
                        style: Global.size22b,
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          "\$$totalPrice",
                          style: Global.size18black,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 40,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Global.botonColor,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Checkout",
                      style: Global.size16w,
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
