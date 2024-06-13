import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:booksapp/models/responcemodel.dart';



class SharedService {

  static Future<ResponseModel?> leadsDetails() async {
    var isCacheKeyExist =
    await APICacheManager().isAPICacheKeyExist("leads_details");

    if (isCacheKeyExist) {
      var cacheData = await APICacheManager().getCacheData("leads_details");

      return responseJson(cacheData.syncData);
    }
  }




  static Future<void> setLeadsDetails(
      ResponseModel loginResponse,
      ) async {

    APICacheDBModel cacheModel = APICacheDBModel(
      key: "leads_details",
      syncData: jsonEncode(loginResponse.toJson()),
    );

    await APICacheManager().addCacheData(cacheModel);

  }


}