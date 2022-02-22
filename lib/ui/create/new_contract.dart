import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibilling/consts/class_const.dart';
import 'package:ibilling/models/user_model.dart';
import 'package:ibilling/themes/colors.dart';
import 'package:ibilling/themes/theme.dart';
import 'package:ibilling/widgets/app_bar.dart';
import 'package:ibilling/widgets/checkbox.dart';
import 'package:ibilling/widgets/new_contract_textfield.dart';

class NewContract extends StatefulWidget {
  const NewContract({Key? key}) : super(key: key);

  @override
  _NewContractState createState() => _NewContractState();
}

class _NewContractState extends State<NewContract> {
  String? entityValue;
  String? statusValue;
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController iNNcontroller = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  // TextEditingController invoiceAmountController = TextEditingController();
  // TextEditingController lastInvoiceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar1(
          title: 'New Contract',
        ),
      ),
      body: Container(
        color: BillingColor.darkWorld,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 6, left: 30),
              child: Text(
                "Лицо",
                style: BillingThemes.textTheme.bodyText2,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(
                    color: Color(0xFFF1F1F1),
                    style: BorderStyle.solid,
                    width: 1.2),
              ),
              margin: const EdgeInsets.only(left: 30, right: 30),
              width: MediaQuery.of(context).size.width,
              child: DropdownButtonFormField<String>(
                validator: (value) {
                  if (value == null) return 'Entity field is empty!!!';
                  return null;
                },
                isExpanded: true,
                icon: SvgPicture.asset(
                  'assets/icons/down_circle.svg',
                  color: BillingColor.greyColor,
                ),
                value: entityValue,
                onChanged: (newValue) {
                  setState(() {
                    entityValue = newValue!;
                  });
                },
                items:
                    Titles.entity.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: TextCheckBox(
                      text: Text(
                        value,
                        style: BillingThemes.textTheme.bodyText2,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 10),
            NewContractTextfield(
              title: "Fisher's full name",
              controller: nameController,
            ),
            const SizedBox(height: 10),
            NewContractTextfield(
              title: "Address of the organization",
              controller: addressController,
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 6, left: 30),
                  child: Text(
                    "INN",
                    style: BillingThemes.textTheme.bodyText2,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 30, right: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 44,
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    cursorColor: BillingColor.whiteColor,
                    controller: iNNcontroller,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1.2,
                            color: Color(0xFFF1F1F1),
                          ),
                          borderRadius: BorderRadius.circular(4.0)),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(bottom: 6, left: 30),
              child: Text(
                "Status of the contract",
                style: BillingThemes.textTheme.bodyText2,
              ),
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(
                    color: const Color(0xFFF1F1F1),
                    style: BorderStyle.solid,
                    width: 1.2),
              ),
              margin: const EdgeInsets.only(left: 30, right: 30),
              width: MediaQuery.of(context).size.width,
              child: DropdownButtonFormField<String>(
                validator: (value) {
                  if (value == null) return 'Entity field is empty!!!';
                  return null;
                },
                dropdownColor: BillingColor.darkColor,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                      width: 1.2,
                      color: Color(0xFFF1F1F1),
                    ),
                  ),
                ),
                isExpanded: true,
                icon: SvgPicture.asset(
                  'assets/icons/down_circle.svg',
                  color: BillingColor.greyColor,
                ),
                value: statusValue,
                onChanged: (newValue) {
                  setState(() {
                    statusValue = newValue!;
                  });
                },
                items: Titles.statuses
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: TextCheckBox(
                      text: Text(
                        value,
                        style: BillingThemes.textTheme.bodyText2,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 25),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
                var usermodel = UserModel(
                    name: nameController.value.text,
                    amount: amountController.value.text,
                    lastInvoice: "5",
                    numberOfInvoice: "2",
                    status: statusController.value.text,
                    date: DateTime.now().toString(),
                    num: "200");
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(122, 13, 122, 13),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: BillingColor.lightGreenColor),
                child: const Text(
                  'Save',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Ubuntu',
                      fontSize: 15.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
