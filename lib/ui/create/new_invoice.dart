import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibilling/consts/class_const.dart';
import 'package:ibilling/themes/colors.dart';
import 'package:ibilling/themes/theme.dart';
import 'package:ibilling/widgets/app_bar.dart';
import 'package:ibilling/widgets/checkbox.dart';
import 'package:ibilling/widgets/new_contract_textfield.dart';

class NewInvoice extends StatefulWidget {
  NewInvoice({Key? key}) : super(key: key);

  @override
  State<NewInvoice> createState() => _NewInvoiceState();
}

class _NewInvoiceState extends State<NewInvoice> {
  String? invoiceStatus;
  TextEditingController serviceNameController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar1(
          title: 'New Invoice',
        ),
      ),
      body: Container(
        color: BillingColor.darkWorld,
        child: ListView(
          children: [
            NewContractTextfield(
              title: "Xizmat nomi",
              controller: serviceNameController,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(bottom: 6, left: 30),
              child: Text(
                "Invoice summasi",
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
                controller: amountController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1.2,
                        color: Color(0xFFF1F1F1),
                      ),
                      borderRadius: BorderRadius.circular(4.0)),
                ),
              ),
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
                value: invoiceStatus,
                onChanged: (newValue) {
                  setState(() {
                    invoiceStatus = newValue!;
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
