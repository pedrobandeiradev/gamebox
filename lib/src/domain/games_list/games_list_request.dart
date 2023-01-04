import 'package:gamebox/src/infra/base_request.dart';

class GamesListRequest extends BaseRequest {
  final String? category;
  final String? platform;
  final int? page;

  GamesListRequest({
    this.category,
    this.platform,
    this.page,
  });

  @override
  Map<String, dynamic> get params => {
        'category': category,
        'platform': platform,
        'page': page,
      };

  @override
  String get endpoint => '/games';
}
