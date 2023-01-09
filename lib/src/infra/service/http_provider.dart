import 'package:gamebox/src/infra/service/api_constants.dart';
import 'package:gamebox/src/infra/service/base_request.dart';
import 'package:http/http.dart';

mixin GameBoxProvider {
  static Future<Response?> execute<T>({
    required BaseHTTPRequest request,
  }) async {
    try {
      final Client provider = Client();

      final uri = Uri.https(
        ApiConstants.baseUrl,
        request.endpoint,
        request.params,
      );

      Response? response;
      switch (request.httpMethod) {
        case HttpMethod.post:
          response = await provider.post(
            uri,
          );

          break;
        case HttpMethod.put:
          response = await provider.put(
            uri,
          );
          break;
        case HttpMethod.delete:
          response = await provider.delete(
            uri,
          );
          break;
        default:
          response = await provider.get(
            uri,
          );
          break;
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
