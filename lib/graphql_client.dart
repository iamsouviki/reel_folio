import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';

class GqlHelper {

  Dio _dio = Dio();

  static String? uuidFromObject(Object object) {
    if (object is Map<String, Object>) {
      final String? typeName = object['__typename']?.toString();
      final String? id = object['id']?.toString();
      if (typeName != null && id != null) {
        return <String>[typeName, id].join('/');
      }
    }
    return null;
  }

  static ValueNotifier<GraphQLClient> clientWrapper() {
    _getClient();
    return ValueNotifier<GraphQLClient>(_getClient() as GraphQLClient);
  }

  static dynamic _getClient() async {
    return await getClient();
  }

  static Future<GraphQLClient> getClient() async {
    final AuthLink apiTokenLink = AuthLink(
      headerKey: 'Authorization',
      getToken: () async {
        //Call the HTTP rest api to get authorization token and return that token here


        var response = await Dio().get('http://stagingdb.reelfolio.com:8080/graphql');

        print(response);

        const String token = '';
        return token;
      },
    );

    Link httpLink = HttpLink("http://stagingdb.reelfolio.com:8080/graphql");

    final Link link = apiTokenLink.concat(httpLink);

    return GraphQLClient(
      cache: GraphQLCache(),
      link: link,
      alwaysRebroadcast: true,
    );
  }
}
