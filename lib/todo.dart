library todo;

import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart' hide ConnectionState;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:realm/realm.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:todo/src/config/app_translations.helpis.dart';

export 'package:todo/src/config/app_translations.helpis.dart';

export 'todo.dart';

part 'app.dart';
part 'src/config/theme.dart';
part 'src/controller/realm_controller.dart';
part 'src/controller/theme_controller.dart';
part 'src/controller/translations_controller.dart';
part 'src/controller/auth_controller.dart';
part 'src/model/models.dart';
part 'src/config/util.dart';
part 'src/view/auth_view.dart';
part 'src/view/widgets/email_auth.dart';
part 'src/view/widgets/email_field.dart';
part 'src/view/widgets/password.dart';
part 'src/view/home_view.dart';
part 'src/view/widgets/resizable_text.dart';
