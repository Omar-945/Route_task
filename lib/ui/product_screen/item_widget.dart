import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_comerce/domain/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemWedget extends StatefulWidget {
  Product? product;

  ItemWedget({super.key, required this.product});

  @override
  State<ItemWedget> createState() => _ItemWedgetState();
}

class _ItemWedgetState extends State<ItemWedget> {
  double scale = 1;
  bool isTabedFav = false;

  @override
  Widget build(BuildContext context) {
    Color textColor = Color(0xFF06004F);
    num? finalPrice;
    num? originalPrice;
    if (widget.product?.discountPercentage == 0 ||
        widget.product?.discountPercentage == null) {
      originalPrice = widget.product?.price ?? 0;
    } else {
      num percentage = (widget.product?.discountPercentage ?? 0) * 0.01;
      num pricePercentage = (widget.product?.price ?? 0) * percentage;
      finalPrice = (widget.product?.price ?? 0) - pricePercentage;
    }
    return Container(
      child: Container(
        width: 200.w,
        height: 240.h,
        decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(.3),
              width: 2.w,
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(13),
                      topEnd: Radius.circular(13)),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: widget.product?.thumbnail ?? '',
                    width: double.infinity,
                    height: 128.h,
                    placeholder: (context, error) => Center(
                      child: Text(
                        widget.product?.title ?? "",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    errorWidget: (context, error, _) => Center(
                        child: Text(
                      'no image',
                      style: TextStyle(fontSize: 14),
                    )),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      scale = 2;
                      isTabedFav = !isTabedFav;
                    });
                  },
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: AnimatedScale(
                        scale: scale,
                        duration: Duration(milliseconds: 500),
                        child: Icon(
                          Icons.favorite_border,
                          color: isTabedFav
                              ? Colors.redAccent
                              : Theme.of(context).primaryColor,
                        ),
                        onEnd: () {
                          setState(() {
                            scale = 1;
                          });
                        },
                      )),
                )
              ],
              alignment: AlignmentDirectional.topEnd,
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product?.title ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      color: textColor,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        finalPrice == null
                            ? '$originalPrice \$'
                            : ' ${finalPrice.toStringAsFixed(2)} \$',
                        style: TextStyle(color: textColor),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        finalPrice == null
                            ? ''
                            : '${widget.product?.price ?? ''}',
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(.6),
                          decoration: finalPrice == null
                              ? null
                              : TextDecoration.lineThrough,
                          decorationColor: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(.6),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'Review (${widget.product?.rating})',
                        style: TextStyle(color: textColor),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Image.asset('assets/images/star.png'),
                      Expanded(
                          child: SizedBox(
                        width: double.infinity,
                      )),
                      Padding(
                        padding: EdgeInsetsDirectional.only(end: 5),
                        child: InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                            radius: 13,
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
