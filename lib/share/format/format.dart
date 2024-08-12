// Format Phone to +84
import 'package:intl/intl.dart';

formatPhoneToE164({required String phoneNumber}){
  return '+84' + phoneNumber.replaceFirst("0", "");
}

//Format String DateTime To dd/MM/YYYY hh:mm
formatStringToDateTime({required String datetime}){
  return DateFormat('dd/MM/yyyy HH:mm').format(DateTime.parse(datetime));
}

//Format number to vnd
formatNumberToVND({required int number}){
  return NumberFormat.decimalPattern('vi').format(number);
}

formatToBirthday({required String datetime}){
  return DateFormat('dd/MM/yyyy').format(DateTime.parse(datetime));
}

formatToDateTimeWithExactlyTime({required String datetime}){
  return  DateFormat('MMM d, yyyy h:mm a').format(DateTime.parse(datetime));
}