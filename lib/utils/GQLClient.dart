import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:talawa/services/preferences.dart';
import 'package:flutter/material.dart';

class GraphQLConfiguration with ChangeNotifier {
  Preferences _pref = Preferences();
  static String token;
  static String orgURI;

//prefix route for showing images
  String displayImgRoute;

  getToken() async {
    final id = await _pref.getToken();
    token = id;
  }

  getOrgUrl() async {
    final url = await _pref.getOrgUrl();
    orgURI = url;
    httpLink = HttpLink(
      "${orgURI}graphql",
    );
    final imgUrl = await _pref.getOrgImgUrl();
    displayImgRoute = imgUrl;
    notifyListeners();
    print(orgURI);
  }

  static HttpLink httpLink = HttpLink(
    "${orgURI}graphql",
  );

  static AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer $token',
  );

  static final Link finalAuthLink = authLink.concat(httpLink);

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: GraphQLCache(store: HiveStore(Hive.box('query'))),
      link: httpLink,
    );
  }

  GraphQLClient authClient() {
    getToken();
    return GraphQLClient(
      cache: GraphQLCache(store: HiveStore(Hive.box('auth'))),
      link: finalAuthLink,
    );
  }
}
