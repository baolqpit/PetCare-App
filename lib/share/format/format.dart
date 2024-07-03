formatPhoneToE164({required String phoneNumber}){
  return '+84' + phoneNumber.replaceFirst("0", "");
}