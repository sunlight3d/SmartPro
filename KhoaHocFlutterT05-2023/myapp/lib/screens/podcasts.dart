import 'package:flutter/material.dart';

class Podcasts extends StatefulWidget {
  const Podcasts({Key? key}) : super(key: key);

  @override
  State<Podcasts> createState() => _PodcastsState();
}

class _PodcastsState extends State<Podcasts> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Lắng nghe sự kiện cuối danh sách đạt đến vị trí cụ thể
    _scrollController.addListener((){
      if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        // Đã cuộn đến cuối danh sách
        print('Scroll to end');
        // Xử lý tại đây
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(child: TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Search',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 0
                      )
                    ),
                  )),
                  GestureDetector(
                    child: Container(
                      child: Icon(Icons.search),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.redAccent
                      ),
                    ),
                    onTap: () {
                      print('search search...');
                    },
                  )

              ],
            ),),
            Expanded(
                child: ListView.builder(
                  controller: _scrollController, // Sử dụng ScrollController
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image.network(
                                  'https://picsum.photos/250?image=9',
                                  width: 100,
                                  height: 100,
                                ),
                              ),

                              SizedBox(width: 10,),
                              Expanded(child: Text('Item $index', style: TextStyle(fontSize: 16),),),
                              Icon(Icons.face_2)
                            ],
                          ),
                          SizedBox(height: 10,),
                          Container(height: 1,decoration:
                            BoxDecoration(color: Colors.blue),
                          )
                        ],
                      ),
                    );
                  },
                )
            )
          ],
        ),
      ),
    );
  }
}
