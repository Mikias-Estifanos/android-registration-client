// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:registration_client/pigeon/document_pigeon.dart';
// import 'package:registration_client/platform_spi/document.dart';

// class DocumentImpl implements Document {
//   @override
//   Future<void> addDocument(String fieldId, String docType, String reference,
//       List<String> bytes) async {
//     try {
//       await DocumentApi().addDocument(fieldId, docType, reference, bytes);
//     } on PlatformException {
//       debugPrint('DocumentApi call failed');
//     } catch (e) {
//       debugPrint('Field not added ${e.toString()}');
//     }
//   }

//   @override
//   Future<void> removeDocument(String fieldId, int pageIndex) async {
//     try {
//       await DocumentApi().removeDocument(fieldId, pageIndex);
//     } on PlatformException {
//       debugPrint('DocumentApi call failed');
//     } catch (e) {
//       debugPrint('SimpleTypeField not added ${e.toString()}');
//     }
//   }

//   @override
//   Future<List<String>> getScannedPages(String fieldId) async {
//     List<String> scannedPages=[];
//     try {
//       scannedPages = await DocumentApi().getScannedPages(fieldId);
//     } on PlatformException {
//       debugPrint('DocumentApi call failed');
//     } catch (e) {
//       debugPrint('Remove field failed ${e.toString()}');
//     }
//     return scannedPages;
//   }

//   @override
//   Future<void> setDateField(String fieldId, String subType, String day,
//       String month, String year) async {
//     try {
//       await DemographicsApi().setDateField(fieldId, subType, day, month, year);
//     } on PlatformException {
//       debugPrint('DemographicsApi call failed');
//     } catch (e) {
//       debugPrint('Date Field not added ${e.toString()}');
//     }
//   }

//   @override
//   Future<void> setConsentField(String consentData) async {
//     try {
//       await DemographicsApi().setConsentField(consentData);
//     } on PlatformException {
//       debugPrint('DemographicsApi call failed');
//     } catch (e) {
//       debugPrint('Date Field not added ${e.toString()}');
//     }
//   }

//   @override
//   Future<String> getDemographicField(String fieldId) async {
//     String fieldValue = "";
//     try {
//       fieldValue = await DemographicsApi().getDemographicField(fieldId);
//     } on PlatformException {
//       debugPrint('DemographicsApi call failed');
//     } catch (e) {
//       debugPrint('Field not added ${e.toString()}');
//     }
//     return fieldValue;
//   }

//   @override
//   Future<String> getSimpleTypeDemographicField(
//       String fieldId, String language) async {
//     String fieldValue = "";
//     try {
//       fieldValue = await DemographicsApi()
//           .getSimpleTypeDemographicField(fieldId, language);
//     } on PlatformException {
//       debugPrint('DemographicsApi call failed');
//     } catch (e) {
//       debugPrint('Field not added ${e.toString()}');
//     }
//     return fieldValue;
//   }
// }

// Document getDemographicsImpl() => DocumentImpl();
