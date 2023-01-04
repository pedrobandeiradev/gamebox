import 'package:gamebox/src/infra/base_request.dart';

class GameDetailsRequest extends BaseRequest {
  final int id;

  GameDetailsRequest({
    required this.id,
  });

  @override
  Map<String, dynamic> get params => {
        'id': id,
      };

  @override
  String get endpoint => '/game';
}
