import 'package:effective/block/home_block.dart';
import 'package:effective/class_helpers/my_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuyerHotel extends StatefulWidget {
  const BuyerHotel({super.key});

  @override
  State<BuyerHotel> createState() => _BuyerHotelState();
}

class _BuyerHotelState extends State<BuyerHotel> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String text = '';
  String? error;
  String? errorPhone;
  late HomeBloc block;
  @override
  void initState() {
    block = context.read<HomeBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyContainer(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.only(top: 8.0, bottom: 12),
        child: Text('Информация о покупателе',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                color: Colors.black)),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: TextField(
            onChanged: onChanged,
            onTap: () {
              if (phoneController.text.isEmpty) {
                phoneController.text = '***) *** - ** - **';
                phoneController.selection =
                    TextSelection.fromPosition(const TextPosition(offset: 0));
              }
            },
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
            keyboardType: TextInputType.phone,
            controller: phoneController,
            decoration: InputDecoration(
              errorText: errorPhone,
              errorStyle: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: Color(0xFF828796),
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              prefixText: '+7 (',
              prefixStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              labelText: 'Номер телефона',
              filled: true,
              fillColor: const Color(0xFFF6F6F9),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                    color: Color(0xFFA9ABB7),
                  )),
            )),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: TextField(
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
            controller: emailController,
            onChanged: validateEmail,
            decoration: InputDecoration(
              errorText: error,
              errorStyle: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: Color(0xFF828796),
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              labelText: 'Почта',
              filled: true,
              fillColor: const Color(0xFFF6F6F9),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                    color: Color(0xFFA9ABB7),
                  )),
            )),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 4.0),
        child: Text(
          'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
          maxLines: 10,
          style: TextStyle(
              overflow: TextOverflow.ellipsis,
              color: Color(0xFF828796),
              fontSize: 14,
              fontWeight: FontWeight.w400),
        ),
      ),
    ]));
  }

  onChanged(String s) {
    String phone = '';
    String mask = '***) ***-**-**';
    int section = 0;
    if (RegExp(r"\d\d\*\*").hasMatch(s) && text.length > s.length) {
      s = s.replaceAll(RegExp(r"\d\*\*"), '');
    }
    if (RegExp(r"\d\)\*").hasMatch(s) && text.length > s.length) {
      s = s.replaceAll(RegExp(r"\d\)\*"), '');
    }
    for (var char in s.characters) {
      if (RegExp(r"\d").hasMatch(char)) {
        phone = phone + char;

        mask = mask.replaceFirst(RegExp(r"\*"), char);
        if (RegExp(r"\*").hasMatch(mask)) {
          section = (mask).indexOf('*');
        } else {
          section = mask.length;
        }
      }
    }
    block.repository.phoneBuyer = phone;
    phoneController.text = mask;
    validatePhone(mask);
    text = mask;
    phoneController.selection =
        TextSelection.fromPosition(TextPosition(offset: section));
  }

  void validatePhone(String s) {
    if ((RegExp(r"^\d{3}\)\s\d{3}\-\d\d\-\d\d$").hasMatch(s))) {
      errorPhone = null;
      setState(() {});
    } else {
      errorPhone = 'Не верный формат телефона';
      setState(() {});
    }
  }

  void validateEmail(String email) {
    if ((RegExp(r"^[a-zA-Z]+@[a-zA-Z]+\.\w{2,}$").hasMatch(email))) {
      error = null;
      setState(() {});
    } else {
      error = 'Не верный формат Email';
      setState(() {});
    }
    block.repository.emailBuyer = email;
  }
}
