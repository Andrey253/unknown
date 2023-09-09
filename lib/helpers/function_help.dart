import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

String spaceSeparateNumbers(int s) => s.toCurrencyString(
    thousandSeparator: ThousandSeparator.Space,
    trailingSymbol: '₽',
    useSymbolPadding: true,
    mantissaLength: 0);
