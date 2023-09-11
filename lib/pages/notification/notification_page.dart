import 'package:afisha_market/core/bloc/notification/notification_bloc.dart';
import 'package:afisha_market/core/bloc/notification/notification_event.dart';
import 'package:afisha_market/core/bloc/notification/notification_state.dart';
import 'package:afisha_market/pages/orders/order_details_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    context.read<NotificationBloc>().add(GetReadNotificationsEvent());
    context.read<NotificationBloc>().add(GetUnReadNotificationsEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationBloc, NotificationState>(
      listener: (context, state) {},
      builder: (context, state) {
        if((state.readNotificationResponse == null) || (state.unReadNotificationResponse == null)){
          return Scaffold(
            body: Center(child: CircularProgressIndicator(),),
          );
        }
        return Scaffold(
          appBar: AppBar(title: const Text('Notifications'),),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ...state.unReadNotificationResponse!.notifications.map((item) => InkWell(
                  onTap: (){
                    context.read<NotificationBloc>().add(ReadNotificationEvent(item.id));
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => OrderDetailsPage(orderId: item.data.orderId,)));
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: state.isRead? Color(0xFFF5F5F5): Colors.green,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${item.data.user}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                        Text(item.data.orderId.toString()??''),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Text('${DateFormat('dd-MM-yyyy HH:mm').format(item.createdAt??DateTime.now())} ')),
                      ],
                    ),
                  ),
                )),
                ...state.readNotificationResponse!.notifications.map((item) => InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => OrderDetailsPage(orderId: item.data.orderId,)));
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${item.data.user}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                        Text(item.data.orderId.toString()??''),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Text('${DateFormat('dd-MM-yyyy HH:mm').format(item.createdAt??DateTime.now())} ')),
                      ],
                    ),
                  ),
                ))
              ],
            ),
          )
        );
      },
    );
  }
}
