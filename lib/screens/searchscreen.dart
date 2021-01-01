import 'package:flutter/material.dart';
import 'package:streaming_anime/screens/detailscreen.dart';
import 'package:streaming_anime/style/style.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<AnimeModel> _searchResult = [];
  List<AnimeModel> _animeDetails = [];

  TextEditingController searchController = TextEditingController();
  void getData() async {
    await APIService().fetchAnime().then((value) {
      setState(() {
        _animeDetails = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Widget _buildSearchResults() {
    return _searchResult == null
        ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          )
        : ListView.builder(
            itemCount: _searchResult.length,
            itemBuilder: (context, i) {
              return GestureDetector(
                child: Card(
                  color: backgroundColor,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        _searchResult[i].image,
                      ),
                    ),
                    title: Text(
                      _searchResult[i].title,
                      style: regularStyle,
                    ),
                  ),
                  margin: const EdgeInsets.all(0.0),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(dataUser: _searchResult[i])));
                },
              );
            },
          );
  }
  
  Widget _buildSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          leading: Icon(Icons.search),
          title: TextField(
            controller: searchController,
            decoration:
                InputDecoration(hintText: 'Search', border: InputBorder.none),
            onChanged: onSearchTextChanged,
          ),
          trailing: searchController.text.isEmpty
              ? null
              : IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    searchController.clear();
                    onSearchTextChanged('');
                  },
                ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(color: backgroundColor, child: _buildSearchBox()),
          Container(
              padding: EdgeInsets.only(left: 10, top: 15),
              alignment: Alignment.centerLeft,
              child:
                  _searchResult.length != 0 || searchController.text.isNotEmpty
                      ? Text(
                          "Hasil Pencarianmu ",
                          style: boldStyle,
                        )
                      : Text(
                          "Rekomendasi Untukmu ",
                          style: boldStyle,
                        )),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: _searchResult.length != 0 || searchController.text.isNotEmpty
                ? _buildSearchResults()
                : Container(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      resizeToAvoidBottomPadding: true,
    );
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    _animeDetails.forEach((anime) {
      if (anime.title.toLowerCase().contains(text) ||
          anime.title.contains(text)) _searchResult.add(anime);
    });
    setState(() {});
  }
}
