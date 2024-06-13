import 'dart:convert';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:booksapp/models/leadmodel.dart';
import 'models/responcemodel.dart';


class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Lead> _leads = [];
  List<Lead> _filteredLeads = [];
  bool _isLoading = true;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadLeads();
    _searchController.addListener(_filterLeads);
  }

  Future<void> _loadLeads() async {
    var isCacheKeyExist =
    await APICacheManager().isAPICacheKeyExist("leads_details");

    if (isCacheKeyExist) {
      var cacheData = await APICacheManager().getCacheData("leads_details");
      var responseJson = json.decode(cacheData.syncData);
      ResponseModel response = ResponseModel.fromJson(responseJson);
      _leads = response.leads;
      _filteredLeads = _leads;

    }



    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? leadsJson = prefs.getString('leads_detail');
    if (leadsJson != null) {
      var responseJson = json.decode(leadsJson);
      ResponseModel response = ResponseModel.fromJson(responseJson);
      _leads = response.leads;
      _filteredLeads = _leads;
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _filterLeads() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredLeads = _leads.where((lead) {
        return lead.firstName.toLowerCase().contains(query) ||
            lead.email.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Search Leads'),

      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              style: const TextStyle(color: Colors.black),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredLeads.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(_filteredLeads[index].imageURL),
                  title: Text(
                    _filteredLeads[index].firstName,
                    style: const TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(
                    _filteredLeads[index].email,
                    style: const TextStyle(color: Colors.black),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

