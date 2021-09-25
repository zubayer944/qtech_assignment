
import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:qtech_jubayer_bin_montasir/common_widget/custom_loader_widget.dart';
import 'package:qtech_jubayer_bin_montasir/common_widget/sub_head_widget.dart';
import 'package:qtech_jubayer_bin_montasir/controller/product_details_controller.dart';
import 'package:qtech_jubayer_bin_montasir/helpers/colors.dart';
import 'package:qtech_jubayer_bin_montasir/model/product_details_model.dart';
import 'package:rich_text_widget/rich_text_widget.dart ';
import 'package:share/share.dart';

class ProductDetailsView extends StatelessWidget {
  final ProductDetailsController _productDetailsController =
      Get.find<ProductDetailsController>();
// bool isVisible = true;
  int discountPrice = 100000;
  final Size _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: _appBarWidget(),
      body: SingleChildScrollView(
        child: Obx(() {
          if (_productDetailsController.productsDataLoading.value == true) {
            return Center(child: CustomLoaderWidget.customLoader());
          } else {
            return _buildProductDetailsWidget(
                  _productDetailsController.getProductData.value,context);
          }
        }),
      ),
    ));
  }

  AppBar _appBarWidget() {
    String shareUrl = "https://flutter.dev/";
    return AppBar(
      title: Text('Product Details'),
      actions: [Container(
          padding: EdgeInsets.all(15),
          child: InkWell(
              onTap: (){
                Share.share(shareUrl);
              },
              child: Icon(Icons.share)))],
    );
  }

  Widget _buildProductDetailsWidget(ProductDetailsModel value,BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 0.1,
          child: Column(
            children: [
              _coverImageWidget(value.detailsImages!),

              _productInfoWidget(
                value.productName.toString(),
                value.productPrice,
                discountPrice,
                value.productReviewAvg
              ),
              Subhead(
                title: 'Select Color',
                subTitle: '',
                onTap: () {},
              ),
              _colorVariationWidget(context),
            ],
          ),
        ),

        SizedBox(
          height: 5,
        ),
        Subhead(title: "Delivery Information",subTitle: '',),
        _deliveryInfoWidget(context,"Sent from Dhaka,will arrive in 7/10 work days"),

        Subhead(title: "Payment Method(Supported)",subTitle: "",),

        _paymentMethod("Bkash","Cash On delivery not available"),

        _visibilityDescription(),

        _visibilityAdditionalInfo(),
      ],
    );
  }


  Widget _coverImageWidget(List<String> value) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: _size.height / 3,
              autoPlay: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                _productDetailsController.sliderImageIndex.value = index;
              }),
          items: value.map((url) {
            return ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: FadeInImage(
                width: double.infinity,
                fit: BoxFit.cover,
                image: ExtendedNetworkImageProvider(
                  url,
                  cache: true,
                ),
                placeholder: AssetImage(''),
                placeholderErrorBuilder: (context, widget, stacktrace) {
                  return Center(
                    child: CupertinoActivityIndicator(),
                  );
                },
                imageErrorBuilder: (context, widget, stacktrace) {
                  return Center(
                    child: Image.asset('assets/download.jpg'),
                  );
                },
              ),
            );
          }).toList(),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          left: 10,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              value.length,
              (index) => buildDot(index: index),
            ),
          ),
        ),
      ],
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: _productDetailsController.sliderImageIndex.value == index ? 20 : 6,
      decoration: BoxDecoration(
        color: _productDetailsController.sliderImageIndex.value == index
            ? primaryColor
            : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

 Widget _productInfoWidget(String bikeName, int pPrice, int discountPrice, var rating) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bikeName.toString(),
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 8,
                child: Row(
                  children: [
                    Text("BDT ${pPrice.toString()}",
                        style: TextStyle(fontSize: 19, color: Colors.red)),
                    SizedBox(
                      width: 10,
                    ),
                    discountPrice == 0
                        ? Container()

                        : Text("BDT ${discountPrice.toString()}",
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey)),
                  ],
                ),
              ),
              SizedBox(),
              //TODO stadium border
              Expanded(
                flex: 2,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    color: Colors.red,
                    child: Text(
                      "50% off",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              )
            ],
          ),
          _ratingBar(rating),
        ],
      ),
    );
  }

 Widget _ratingBar( var rating) {
    return RatingBar.builder(
      itemSize: 20,
      initialRating: double.parse(rating.toString()),
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      ignoreGestures: true,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.red,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }

  Widget _colorVariationWidget(BuildContext context){
    return CustomRadioButton(
      spacing: 2,
      autoWidth: true,
      padding: 10,
      enableShape: true,
      wrapAlignment: WrapAlignment.spaceAround,
      width: 80,
      height: 30,
      elevation: 0,
      absoluteZeroSpacing: false,
      unSelectedColor: Theme.of(context).canvasColor,
      unSelectedBorderColor: Colors.black,
      buttonLables: [
        'Black',
        'Blue',
        'Red',
        'Yellow',
      ],
      buttonValues: [
        "Black",
        "Blue",
        "Red",
        "Yellow",
      ],
      buttonTextStyle: ButtonTextStyle(
          selectedColor: Colors.black,
          unSelectedColor: Colors.red,
          textStyle: TextStyle(fontSize: 16)),
      radioButtonValue: (value) {
        print(value);
      },
      selectedColor: Colors.yellow,
    );
  }

  Widget _deliveryInfoWidget(BuildContext context,String txt) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          Icon(Icons.delivery_dining),
          SizedBox(
            width: 10,
          ),
          RichTextWidget(
            Text(
              txt,
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            richTexts: [
              BaseRichText(
                "Dhaka",
                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 16),
              ),
              BaseRichText(
                "7/10",
                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 16),
              ),
            ],
          ),
          // Text("${txt.toString()}",style: TextStyle(),)
        ],
      ),
    );
  }

  Widget _paymentMethod(String txt1, String txt2) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          Icon(Icons.check_circle_outline,color: Colors.green,),
          SizedBox(
            width: 5,
          ),
          Text("${txt1.toString()}"),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.close_rounded,color: Colors.red,),
          SizedBox(
            width: 5,
          ),
          Text("${txt2.toString()}")
        ],
      ),
    );
  }

  Widget _visibilityDescription(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text("Description", style: TextStyle(
                fontWeight: FontWeight.bold,
                color: primaryColor,
                fontSize: 16),),
            _productDetailsController.isVisibleDescription.value == true
                ? InkWell(
                onTap: (){
                  _productDetailsController.isVisibleDescription.value =! _productDetailsController.isVisibleDescription.value;
                },
                child: Icon(Icons.arrow_drop_down))
                : InkWell(
                onTap: (){
                  _productDetailsController.isVisibleDescription.value =! _productDetailsController.isVisibleDescription.value;
                },
                child: Icon(Icons.arrow_drop_up))
          ],),
        ),
        Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(5),
          child:Obx((){
            return  Visibility(
                visible: _productDetailsController.isVisibleDescription.value,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("\u2022 Soft-touch jersy"),
                    Text("\u2022 Lose-Fabric"),
                    Text("\u2022 High Sensitive"),
                    Text("\u2022 Lose-Fabric"),
                    Text("\u2022 High-sensitive"),
                  ],
                ));
          })
        ),
      ],
    );
  }

  Widget _visibilityAdditionalInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Additional Information", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                  fontSize: 16),),
              _productDetailsController.isVisibleAdditional.value == true
                  ? InkWell(
                  onTap: (){
                    _productDetailsController.isVisibleAdditional.value =! _productDetailsController.isVisibleAdditional.value;
                  },
                  child: Icon(Icons.arrow_drop_down))
                  : InkWell(
                  onTap: (){
                    _productDetailsController.isVisibleAdditional.value =! _productDetailsController.isVisibleAdditional.value;
                  },
                  child: Icon(Icons.arrow_drop_up))
            ],),
        ),
        Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            child:Obx((){
              return  Visibility(
                  visible: _productDetailsController.isVisibleAdditional.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("\u2022 Soft-touch jersy"),
                      Text("\u2022 Lose-Fabric"),
                      Text("\u2022 High Sensitive"),
                      Text("\u2022 Lose-Fabric"),
                      Text("\u2022 High-sensitive"),
                    ],
                  ));
            })
        ),
      ],
    );
  }

}
