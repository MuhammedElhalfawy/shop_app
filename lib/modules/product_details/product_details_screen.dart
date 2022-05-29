import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/product_details_model.dart';
import 'package:shop_app/shared/styles/colors.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class ProductDetailsScreen extends StatelessWidget {
   ProductDetailsScreen({Key? key,}) : super(key: key);
  final productImages = PageController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        DataModel ? model = ShopCubit.get(context).productDetailsModel?.data;
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Product Details',
            ),
            centerTitle: true,
          ),
          body: state is ShopLoadingProductDetailsState? const Center(child: CircularProgressIndicator()) :
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 400.0,
                        child: PageView.builder(
                          physics: const BouncingScrollPhysics(),
                          controller: productImages,
                            itemBuilder: (context, index) => Image(
                                image: NetworkImage(model!.images![index]),
                            ),
                          itemCount: model!.images!.length,
                        ),
                      ),
                      if (model.discount != 0)
                      Container(
                        color: Colors.red,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: const Text(
                          'DISCOUNT',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${model.name}',
                          style: const TextStyle(
                            fontSize: 20.0,
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'EGP ${model.price}',
                              style: const TextStyle(
                                fontSize: 30.0,
                                color: defaultColor,
                              ),
                            ),
                            if (model.discount != 0)
                            Row(
                              children: [
                                Text(
                                  '${model.oldPrice}',
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  '${model.discount}%',
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          '${model.description}',
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
