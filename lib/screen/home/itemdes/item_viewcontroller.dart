import 'package:falter/networking/all_network_req.dart';
import 'package:falter/networking/jsonfile/getproduct_json.dart';
import 'package:get/get.dart';

class ItemViewController extends GetxController{

  AllNetworkingReq _allNetworkingReq = AllNetworkingReq();
  GetProductJson? prodect;
  bool getdatafromweb=true;
  getDataOfItem(int i)async{
     var data= await _allNetworkingReq.getproduct(i.toString()) ;
     updateprodect(data);
  }
updateprodect(GetProductJson dat){
  prodect=dat;
  getdatafromweb=false;
    update();
}
}