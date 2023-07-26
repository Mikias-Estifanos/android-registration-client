import 'dart:math';

import 'package:flutter/services.dart';
import 'package:registration_client/pigeon/master_data_sync_pigeon.dart';
import 'package:registration_client/platform_spi/sync_response.dart';

class SyncResponseImpl implements SyncResponse {
  @override
  Future<Sync> getPolicyKeySync() async {
    late Sync syncResponse;
    try {
      syncResponse = await SyncApi().getPolicyKeySync();
    } on PlatformException {
      print('PolicyKeySync Api call failed, PlatformException');
    } catch (e) {
      print('PolicyKeySync has failed! ${e.toString()}');
    }
    return syncResponse;
  }

  @override
  Future<Sync> getGlobalParamsSync() async {
    late Sync syncResponse;
    try {
      syncResponse = await SyncApi().getGlobalParamsSync();
    } on PlatformException {
      print('GlobalParamsSync Api call failed, PlatformException');
    } catch (e) {
      print('GlobalParamsSync has failed! ${e.toString()}');
    }
    return syncResponse;
  }

  @override
  Future<Sync> getUserDetailsSync() async {
    late Sync syncResponse;
    try {
      syncResponse = await SyncApi().getUserDetailsSync();
    } on PlatformException {
      print('UserDetailsSync Api call failed, PlatformException');
    } catch (e) {
      print('UserDetailsSync has failed! ${e.toString()}');
    }
    return syncResponse;
  }

  @override
  Future<Sync> getIDSchemaSync() async{
     late Sync syncResponse;
    try {
      syncResponse = await SyncApi().getIDSchemaSync();
    } on PlatformException {
      print('IDSchemaSync Api call failed, PlatformException');
    } catch (e) {
      print('IDSchemaSync has failed! ${e.toString()}');
    }
    return syncResponse;
  }
  
  @override
  Future<Sync> getMasterDataSync() async {
      late Sync syncResponse;
    try {
      syncResponse = await SyncApi().getMasterDataSync();
    } on PlatformException {
      print('MasterDataSync Api call failed, PlatformException');
    } catch (e) {
      print('MasterDataSync has failed! ${e.toString()}');
    }
    return syncResponse;
  }
  
  @override
  Future<SyncTime> getLastSyncTime() async {
     late SyncTime syncTime;
    try {
      syncTime = await SyncApi().getLastSyncTime();
    } on PlatformException {
      print('Unable to get last sync time!');
    } catch (e) {
      print('Unable to get last sync time! ${e.toString()}');
    }
    return syncTime;
  }
}
