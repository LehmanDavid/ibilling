import 'package:flutter/material.dart';
import '../ui/contract_page.dart';
import '../ui/create/new_contract.dart';
import '../ui/history_page.dart';
import '../ui/profile_page.dart';
import '../ui/saved_page.dart';
import 'package:easy_localization/easy_localization.dart';

class Pages {
  static var pages = <Widget>[
    const ContractPage(),
    const HistoryPage(),
    const NewContract(),
    const SavedPage(),
    const ProfilePage(),
  ];
}

class Titles {
  static List<String> labels = <String>[
    'contracts'.tr(),
    'history'.tr(),
    'new_contract'.tr(),
    'saved'.tr(),
    'profile'.tr(),
    'new_invoice'.tr(),
  ];

  static List<String> statuses = <String>[
    'paid'.tr(),
    'in_process'.tr(),
    'rejected_by_IQ'.tr(),
    'rejected_by_payme'.tr(),
  ];

  static List<String> entity = <String>[
    'individual'.tr(),
    'legal_entity'.tr(),
  ];
}
