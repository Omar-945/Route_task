import 'package:e_comerce/di/di.dart';
import 'package:e_comerce/ui/product_screen/item_widget.dart';
import 'package:e_comerce/ui/product_screen/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductScreen extends StatefulWidget {
  static const String route = "productScreen";

  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ProductViewModel viewModel = getIt.get<ProductViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: double.infinity,
          leading: Row(
            children: [
              Padding(
                  padding: EdgeInsetsDirectional.only(start: 15),
                  child: Image.asset("assets/images/logo.png")),
            ],
          ),
        ),
        body: BlocBuilder<ProductViewModel, ProductState>(
          bloc: viewModel,
          builder: (BuildContext context, ProductState state) {
            switch (state) {
              case Loading():
                {
                  return Center(child: CircularProgressIndicator());
                }
              case Error():
                {
                  return Center(
                      child: Text(
                    'some thing went wrong',
                    style: TextStyle(fontSize: 14),
                  ));
                }
              case Success():
                {
                  return Padding(
                    padding: EdgeInsetsDirectional.only(start: 17, end: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: TextField(
                              maxLines: 1,
                              decoration: InputDecoration(
                                prefixIcon:
                                    Image.asset("assets/images/search.png"),
                                hintText: 'what do you search for?',
                                hintStyle: GoogleFonts.poppins(
                                  color: Color(0xFF06004F).withOpacity(.6),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        width: 1)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(35),
                                    borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        width: 1)),
                              ),
                            )),
                            SizedBox(
                              width: 3,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Theme.of(context).primaryColor,
                                  size: 30,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Expanded(
                            child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 2 / 2.58,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 15),
                          itemBuilder: (context, index) => ItemWedget(
                            product: state.products?[index],
                          ),
                          itemCount: 20,
                        ))
                      ],
                    ),
                  );
                }
            }
          },
        ));
  }
}
