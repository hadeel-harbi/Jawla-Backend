import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../Middelwares/CheckTokenMiddelware.dart';
import '../Response/Owner/addActivityResponse.dart';
import '../Response/Owner/displayAllOwnerActivityResponse.dart';
import '../Response/User/displayReservationsResponse.dart';

class OwnerRoute {
  Handler get handler {
    final router = Router()
    ..post('/add_activity', addActivityResponse)
    ..get('/display_activities', displayReservationsResponse);

    final pipline =
        Pipeline().addMiddleware(checkTokenMiddleware()).addHandler(router);

    return pipline;
  }
}
