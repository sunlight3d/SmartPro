import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/models/user.dart';

/*
https://api.slingacademy.com/v1/sample-data/users?offset=20&limit=10
*/

class Podcasts extends StatefulWidget {
  const Podcasts({Key? key}) : super(key: key);

  @override
  State<Podcasts> createState() => _PodcastsState();
}

class _PodcastsState extends State<Podcasts> {
  final ScrollController _scrollController = ScrollController();
  List<User> _users = [];
  bool _isLoading = false;
  int _offset = 0;
  int _limit = 10;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchUsers();
    // Lắng nghe sự kiện cuối danh sách đạt đến vị trí cụ thể
    _scrollController.addListener((){
      if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        // Đã cuộn đến cuối danh sách
        print('page: ${_offset / _limit + 1}');
        _fetchUsers();
        // Xử lý tại đây
      }
    });
  }
  Future<void> _fetchUsers() async {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
    });
    try {
      final response = await http.get(
          Uri.parse('https://api.slingacademy.com/v1/sample-data/users?offset=$_offset&limit=$_limit'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final List<dynamic> userJsonList = jsonData['users'];

        List<User> fetchedUsers = userJsonList
                  .map((json) => User.fromJson(json))
                  .toList();//convert list of Json => list of Users
        setState(() {
          _users.addAll(fetchedUsers);
          _offset += _limit;
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to fetch users');
      }
    } catch (error) {
      print(error);
      setState(() {
        _isLoading = false;
      });
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
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
                  itemCount: _users.length + (_isLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < _users.length) {
                      final user = _users[index];
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
                                Expanded(child:
                                Text('${user.firstName} ${user.lastName}',
                                  style: TextStyle(fontSize: 16),),),
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
                    } else if (_isLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return SizedBox();
                    }

                  },
                )
            )
          ],
        ),
      ),
    );
  }
}

/*
Trong Flutter, tôi gọi api đến:
https://api.slingacademy.com/v1/sample-data/users?offset=20&limit=10
Giá trị trả về có trường users là mảng các đối tượng có các fields sau:
{
"last_name": "Todd",
"id": 22,
"email": "wilsonharold@example.com",
"date_of_birth": "1997-07-12T00:00:00",
"job": "Journalist, newspaper",
"city": "Lake Taylorton",
"zipcode": "62791",
"latitude": 82.3926255,
"gender": "female",
"first_name": "Rebecca",
"phone": "038.420.7539x46680",
"street": "8575 Chris Mount",
"state": "Florida",
"country": "Albania",
"longitude": 116.869109
},
viết phần gọi api lấy dữ liệu trả về, yêu cầu có models
Khi scroll đến cuối danh sách, sẽ tự động gọi api đến trang tiếp theo, kiểu như chức năng load more

* */

/*
Hãy viết chi tiết phần validate vào đoạn này:
VD: nếu json['last_name'] là null hoặc empty thì giá trị mặc định là ""
nếu json['longitude'] là null => giá trị là 0,....

factory User.fromJson(Map<String, dynamic> json) {
    return User(
      lastName: json['last_name'],
      id: json['id'],
      email: json['email'],
      dateOfBirth: DateTime.parse(json['date_of_birth']),
      job: json['job'],
      city: json['city'],
      zipcode: json['zipcode'],
      latitude: json['latitude'],
      gender: json['gender'],
      firstName: json['first_name'],
      phone: json['phone'],
      street: json['street'],
      state: json['state'],
      country: json['country'],
      longitude: json['longitude'],
    );
  }
* */