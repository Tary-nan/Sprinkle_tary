import 'package:rxdart/rxdart.dart';


import 'package:sprinkle_architecture_tary/Manager/Manager.dart';
import 'package:sprinkle_architecture_tary/Models/DirectModel.dart';
import 'package:sprinkle_architecture_tary/Services/DirectService.dart';



class ExampleManager implements Manager {

  // *****  first

  final PublishSubject<String> _filterSubject = PublishSubject<String>();
  final PublishSubject<List<Direct>> _collectionSubject = PublishSubject<List<Direct>>();


  Sink<String> get inFilter => _filterSubject.sink;
  Stream<List<Direct>> get browser$ => _collectionSubject.stream;

  /*
  Stream<List<Direct>> userFilter({query}) =>
      Stream.fromFuture(DirectService.browser(query: query));
   */

  ExampleManager(){
    _filterSubject
        .debounceTime(Duration(milliseconds: 300))
        .switchMap((filter)async*{
      yield await DirectService.browser(query: filter);
    })
        .listen((data) async{
      _collectionSubject.add(data);
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
