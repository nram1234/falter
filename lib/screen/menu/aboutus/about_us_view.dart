import 'package:falter/utilitie/utilitie.dart';
import 'package:flutter/material.dart';

class AboutUsFiew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarcolors,title: Text('من نحن'),centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
            "هي الشركة  الرائدة الأولى في مجال تنقية المياه المخصصة للاستخدام المنزلي في مصر. بمنتجاتها التي تتجاوز 25 حلاً مبتكرًا ومتنوعًا يتناسب كل منها مع احتياجات كل أسرة للاستمتاع بمياه شرب نقية وصحية وسهلة، قدمت تانك خدماتها للملايين منذ تأسيسها عام 1989. كما تفخر تانك بالتوسع في حجم أعمالها وذلك بتصدير منتجاتها التي حازت على ثقة المستخدمين على مستوى 22 دولة في شمال أفريقيا ومنطقة دول الخليج والشرق الأقصى."),
      ),
    );
  }
}
