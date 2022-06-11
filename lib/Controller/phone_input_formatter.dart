import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

final phoneMaskFormatter = MaskTextInputFormatter(
    filter: {"#": RegExp(r'[0-9]')},
    mask: '+90 ### ### ## ##',
    type: MaskAutoCompletionType.lazy);
