import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:thyyweets/app/repositories/twitter_repository.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }


  Future<List<dynamic>> listTweets({String track}) async{

    var twt = TwitterRepoitory();
    List<dynamic> res;
    if(track == null){
       res = await twt.getTweets(track:track);
    }else{
     res = await twt.getTweets(track:track);
    }

    return res;
  }


  Future<List<dynamic>> searchTweets(String track) async{

    var twt = TwitterRepoitory();
    var res = await twt.getSearchTweets(track);

    return res;
  }
}
