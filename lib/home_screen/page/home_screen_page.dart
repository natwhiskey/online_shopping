import 'package:flutter/material.dart';
import 'package:online_shopping/home_screen/controller/home_screen_controller.dart';
import 'package:online_shopping/model/shopping_model.dart';
import 'package:online_shopping/utility/sizer.dart';
import 'package:provider/provider.dart';


class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});


  @override
  State<HomeScreenPage> createState() => _HomeScreenPage();
}

class _HomeScreenPage extends State<HomeScreenPage> {
   HomeScreenController? controller;

 @override
  void initState() {
    controller = HomeScreenController(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: controller,
      child: Consumer<HomeScreenController>(builder: (context, con, _) {
      ShipingModel shippingModel = con.getProductItem();
       return Scaffold(
        body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               const Padding(
                  padding: EdgeInsets.only(bottom: 15, left: 15),
                  child: Text(
                    'Recommendation',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GridView.builder(
                      primary: false,
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200.0,
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 13.0,
                      ),
                      itemCount: shippingModel.productItems?.length ?? 0,
                      itemBuilder: (BuildContext ctx, index) {
                        return GestureDetector(
                          onTap: () {
                            // con.addFavorite(index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                            alignment: Alignment.bottomCenter,
                            child: Stack(
                              children: [
                                Container(
                                  height: double.infinity,
                                  width: Sizer(context).w,
                                  child: Image.network(shippingModel.productItems?[index].imageUrl ?? '')),
                                _buildCardImage(con, index),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            )
      );
      },)
    );
  }
  Widget _buildCardImage(HomeScreenController con, int index) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
          onTap: () {
            con.addFavorite(index);
          },
          child: Icon(
            con.isProductFavorite(index) ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

