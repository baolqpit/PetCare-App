import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/pet_store_controller.dart';
import 'package:petcare_app_management/model/pet_store_model/product_model/product_model.dart';
import 'package:petcare_app_management/model/pet_store_model/shop_model/shop_model.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';
import 'package:petcare_app_management/share/Widgets/dialog.dart';

class CreateNewProduct extends StatefulWidget {
  final ShopModel shopModel;
  const CreateNewProduct({super.key, required this.shopModel});

  @override
  State<CreateNewProduct> createState() => _CreateNewProductState();
}

class _CreateNewProductState extends State<CreateNewProduct> {
  final PetStoreController petStoreController = Get.find();
   TextEditingController productNameController = TextEditingController();
   TextEditingController productURLController = TextEditingController();
   TextEditingController productPriceController = TextEditingController();
   TextEditingController productQuantityController =
      TextEditingController();
  Rx<int> productTypeId = Rx<int>(1);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return showAlertDialog(
                    context: context,
                    title: 'Create New Product',
                    onSubmitFunction: () async => await createNewProduct(),
                    widget: Obx(() => _buildCreateProduct()));
              });
        },
        child: Icon(Icons.add));
  }

  createNewProduct() async {
    ProductModel productModel = new ProductModel(
      productName: productNameController.text,
      productImgURL: productURLController.text,
      shopId: widget.shopModel.shopId,
      price: int.parse(productPriceController.text),
      quantity: int.parse(productQuantityController.text),
      productTypeId: productTypeId.value,
      productTypeName: productTypeId.value == 1 ? 'Food' : 'Supplies',
    );
    await petStoreController.createNewProduct(
        productModel: productModel, shopId: widget.shopModel.shopId!);
    await petStoreController.getListProducts();
    await petStoreController.getListProductsInShop(shopId: widget.shopModel.shopId!);
    resetValue();
    Get.back();
  }

  resetValue(){
    productNameController.clear();
    productURLController.clear();
    productPriceController.clear();
    productQuantityController.clear();
    productTypeId.value = 1;
  }

  _buildCreateProduct() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTextField(
            controller: productNameController,
            label: 'Product Name',
            hintText: 'Nekko Pate',
            isNumberType: false,
          ),
          _buildTextField(
              controller: productURLController,
              label: 'Product URL',
              hintText: 'URL',
              isNumberType: false),
          _buildTextField(
              controller: productPriceController,
              label: 'Price (per one)',
              hintText: '20000',
              isNumberType: true),
          _buildTextField(
              controller: productQuantityController,
              label: 'Quantity',
              hintText: '10',
              isNumberType: true),
          Dimens.height10,
          _buildProductType()
        ],
      ),
    );
  }

  _buildTextField(
      {required TextEditingController controller,
      required bool isNumberType,
      required String label,
      required String hintText}) {
    return TextField(
      controller: controller,
      keyboardType: isNumberType ? TextInputType.number : null,
      decoration: InputDecoration(
        hintText: hintText,
        label: AppText(content: label),
      ),
    );
  }

  _buildProductType() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppText(content: 'Product Type'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              children: <Widget>[
                Radio(
                    value: 1,
                    groupValue: productTypeId.value,
                    onChanged: (value) {
                      value != null ? productTypeId.value = value : null;
                    }),
                AppText(content: 'Food')
              ],
            ),
            Row(
              children: [
                Radio(
                    value: 2,
                    groupValue: productTypeId.value,
                    onChanged: (value) {
                      value != null ? productTypeId.value = value : null;
                    }),
                AppText(content: 'Supplies')
              ],
            ),
          ],
        )
      ],
    );
  }
}
