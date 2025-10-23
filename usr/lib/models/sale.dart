import 'package:couldai_user_app/models/cellphone.dart';

class Sale {
  final Cellphone cellphone;
  final int quantitySold;
  final DateTime saleDate;

  Sale({
    required this.cellphone,
    required this.quantitySold,
    required this.saleDate,
  });
}
