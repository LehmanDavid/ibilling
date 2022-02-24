import 'package:flutter/material.dart';
import '../ui/contract_page.dart';
import '../ui/create/new_contract.dart';
import '../ui/history_page.dart';
import '../ui/profile_page.dart';
import '../ui/saved_page.dart';

class Pages {
  static var pages = <Widget>[
    const ContractPage(),
    const HistoryPage(),
    const NewContract(),
    const SavedPage(),
    //const ProfilePage(),
  ];
}

class Titles {
  static List<String> labels = <String>[
    'contracts',
    'history',
    'new_contract',
    'saved',
    'profile',
    'new_invoice',
  ];

  static List<String> statuses = <String>[
    'paid',
    'in_process',
    'rejected_by_IQ',
    'rejected_by_payme',
  ];

  static List<String> entity = <String>[
    'individual',
    'legal_entity',
  ];
}
