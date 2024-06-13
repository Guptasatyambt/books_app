import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:booksapp/search.dart';
import 'package:booksapp/services/api_servece.dart';
import 'package:flutter/material.dart';

import 'package:booksapp/models/responcemodel.dart';

import 'models/requestmodel.dart'; // Import your model file

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  void load(){
    RequestModel model = RequestModel(
      notaryId: "6668baaed6a4670012a6e406",

    );
    APIService.getleads(model);
  }
  late Future<ResponseModel> _loginResponse;

  static Future<ResponseModel> _getLeadsFromCache() async {
    var isCacheKeyExist =
    await APICacheManager().isAPICacheKeyExist("leads_details");

    if (isCacheKeyExist) {
      var cacheData = await APICacheManager().getCacheData("leads_details");
      return responseJson(cacheData.syncData);

    }
    throw Exception('No leads data found in cache');
  }

  @override
  void initState() {
    super.initState();
    load();
    _loginResponse = _getLeadsFromCache();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Search()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<ResponseModel>(
        future: _loginResponse,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('No data found'));
          } else {
            final leads = snapshot.data!.leads;
            return ListView.builder(
              itemCount: leads.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(leads[index].imageURL),
                  title: Text(leads[index].firstName, style: const TextStyle(color: Colors.black)),
                  subtitle: Text(leads[index].email, style: const TextStyle(color: Colors.black)),
                );
              },
            );
          }
        },
      ),
    );
  }
}


