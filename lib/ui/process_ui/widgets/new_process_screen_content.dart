import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:registration_client/model/field.dart';
import 'package:registration_client/model/screen.dart';
import 'package:registration_client/pigeon/location_response_pigeon.dart';
import 'package:registration_client/provider/global_provider.dart';
import 'package:registration_client/provider/location_provider.dart';
import 'package:registration_client/provider/registration_task_provider.dart';
import 'package:registration_client/ui/process_ui/widgets/age_date_control.dart';
import 'package:registration_client/ui/process_ui/widgets/biometric_capture_control.dart';
import 'package:registration_client/ui/process_ui/widgets/checkbox_control.dart';
import 'package:registration_client/ui/process_ui/widgets/document_upload_control.dart';
import 'package:registration_client/ui/process_ui/widgets/dropdown_control.dart';
import 'package:registration_client/ui/process_ui/widgets/html_box_control.dart';
import 'package:registration_client/ui/process_ui/widgets/custom_label.dart';

import 'package:registration_client/ui/process_ui/widgets/button_control.dart';
import 'package:registration_client/ui/process_ui/widgets/textbox_control.dart';
import 'package:registration_client/ui/scanner/scanner.dart';
import 'radio_button_control.dart';

class NewProcessScreenContent extends StatefulWidget {
  const NewProcessScreenContent(
      {super.key, required this.context, required this.screen});
  final BuildContext context;
  final Screen screen;

  @override
  State<NewProcessScreenContent> createState() =>
      _NewProcessScreenContentState();
}

class _NewProcessScreenContentState extends State<NewProcessScreenContent> {
  @override
  void initState() {
    context.read<LocationProvider>().setLocationResponse("eng");
    super.initState();
  }

  Map<String, dynamic> formValues = {};

  Widget widgetType(Field e) {
    RegExp regexPattern = RegExp(r'^.*$');

    if (e.validators!.isNotEmpty) {
      final validation = e.validators?.first?.validator;
      if (validation != null) {
        regexPattern = RegExp(validation);
      }
    }
    switch (e.controlType) {
      case "checkbox":
        return CheckboxControl(field: e);
      case "html":
        return HtmlBoxControl(field: e);
      case "biometrics":
        return BiometricCaptureControl(field: e);
      case "button":
        if (e.subType == "preferredLang") {
          return ButtonControl(field: e);
        }
        if (e.subType == "gender" || e.subType == "residenceStatus") {
          return RadioButtonControl(field: e);
        }
        return Text("${e.controlType}");
      case "textbox":
        return TextBoxControl(e: e, validation: regexPattern);
      case "dropdown":
        return DropDownControl(
          validation: regexPattern,
          field: e,
        );
      case "ageDate":
        return AgeDateControl(
          field: e,
          validation: regexPattern,
        );
      case "fileupload":
        //return Text("The sub type is${e.subType}");
        //return a widget for each subtype the widget is
        //bool isMobile = MediaQuery.of(context).size.width < 750;
        // return document_upload_card(isMobile, e, regexPattern);
        return DocumentUploadControl(
          field: e,
          validation: regexPattern,
        );
      default:
        return Text("${e.controlType}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.watch<GlobalProvider>().formKey,
      child: Column(
        children: [
          ...widget.screen.fields!.map((e) {
            if (e!.inputRequired == true) {
              return widgetType(e);
            }
            return Container();
          }).toList(),
        ],
      ),
    );
  }
}
