import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/user_controller.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';

import '../../share/Colors/app_color.dart';

class OtpAuthentication extends StatefulWidget {
  const OtpAuthentication({super.key});

  @override
  State<OtpAuthentication> createState() => _OtpAuthenticationState();
}

class _OtpAuthenticationState extends State<OtpAuthentication> {
  final UserController userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildOTPContent(),
    );
  }

  _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Get.back(),
      ),
      title: Center(
        child: AppText(
          content: 'Return to sign up',
        ),
      ),
    );
  }

  _buildOTPContent() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: Dimens.padding_horizontal,
            vertical: Dimens.padding_vertical),
        child: Column(
          children: <Widget>[
            _buildOTPTitle(),
            Dimens.height20,
            _buildOTPInputValuesRow(),
            Dimens.height15,
            _buildResentOTP(),
            Dimens.height15,
            _buildOTPSendButton()
          ],
        ),
      ),
    );
  }

  _buildOTPTitle() {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: Dimens.font_size_max,
          fontWeight: FontWeight.bold,
          color: AppColor.primary, // Màu sắc mặc định cho toàn bộ văn bản
        ),
        children: <TextSpan>[
          TextSpan(text: 'We have sent an OTP to '),
          TextSpan(
            text: '${userController.phoneController.text}',
            style: TextStyle(
              color: AppColor.orange, // Màu sắc khác cho phần số điện thoại
            ),
          ),
        ],
      ),
    );
  }

  _buildOTPInputValuesRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildOTPInputField(),
        _buildOTPInputField(),
        _buildOTPInputField(),
        _buildOTPInputField(),
      ],
    );
  }

  _buildOTPInputField() {
    return SizedBox(
      width: Dimens.width_OTP,
      height: Dimens.height_OTP,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0), // Adjust the radius as needed
            ),
          ),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }

  _buildResentOTP() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        AppText(content: 'Did not receive OTP?'),
        ElevatedButton(onPressed: () {}, child: AppText(content: 'Get OTP'))
      ],
    );
  }

  _buildOTPSendButton() {
    return ElevatedButton(
      onPressed: () {},
      child: AppText(
        content: 'Verify',
        color: AppColor.white,
        fontWeight: FontWeight.bold,
        textSize: Dimens.font_size_title,
      ),
      style: ElevatedButton.styleFrom(backgroundColor: AppColor.orange),
    );
  }
}
