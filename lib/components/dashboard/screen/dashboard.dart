import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../api helper.dart';
import '../../../api model.dart';
import '../../../utils/global/global.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 18),
            child: CircleAvatar(
              radius: 26,
              backgroundColor: Color(0xffFFFFFF),
              child: Center(
                child: IconButton(
                  onPressed: () {
                    Get.toNamed('/cart');
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        backgroundColor: Color(0xffF5F5F5),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Product",
          style: Global.size22,
        ),
        leadingWidth: 66,
      ),
      body: FutureBuilder<List<Product>>(
        future: ApiHelper.api.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Product>? category = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: w,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 250,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: category!.length,
                        itemBuilder: (context, index) {
                          final product = category[index];
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed('/product',
                                  arguments: category[index]);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xffF5F5F5),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.black54),
                              ),
                              alignment: Alignment.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: h * .21,
                                    width: w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          product.image,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 8.0, top: 15),
                                    child: Text(
                                      "${product.title}",
                                      style: Global.size18black,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 8.0,
                                      bottom: 15,
                                    ),
                                    child: Text(
                                      '\$${product.price}',
                                      style: Global.size18black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
